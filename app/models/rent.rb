class Rent < ApplicationRecord
  include AASM
  paginates_per 10
  belongs_to :user
  has_many :movie_rents, dependent: :delete_all

  validates :user_id, :rental_end_date, presence: true
  accepts_nested_attributes_for :movie_rents, reject_if: proc { |attributes| attributes['quantity'].blank? }

  validate :validate_unique_movie_rent

  def validate_unique_movie_rent
    #the second argument is an array so it can take multiple fields
    validate_uniqueness_of_in_memory(movie_rents, [:movie_id], 'Movie already exists in this rent')
  end

  enum status: [:pending, :done, :late]

  scope :by_end_date, ->(direction) { order rental_end_date: direction }
  scope :by_total_to_pay, ->(direction) { order total_to_pay: direction }
  scope :filter_by, ->(status) { order status: status }

  aasm :column => :status, :enum => true do
    state :pending, :initial => true
    state :done, :late

    event :return_rental do
      before do
        if pending?
          returning_on_time
        elsif late?
          not_returning_on_time
        end
      end
      transitions :from => [:pending, :late], :to => :done
    end

    event :mark_as_late do
      before do
        update_late_penalty_amount
      end
      transitions :from => :pending, :to => :late
    end
  end

  def rental_days
    (rental_end_date.to_date-created_at.to_date).to_i
  end

  def rental_extra_days
    (Date.today.to_date-rental_end_date.to_date).to_i
  end

  def rental_current_extra_days
    (rental_return_date.to_date-rental_end_date.to_date).to_i
  end

  def returning_on_time
    self.rental_return_date=Date.today
    self.return_on_time=true
    self.total_to_pay = rental_total_ammount
    self.save
  end

  def not_returning_on_time
    self.rental_return_date=Date.today
    update_late_penalty_amount
  end

  def update_late_penalty_amount
    if rental_extra_days > 0
      self.delayed_return_days = rental_extra_days
      self.return_on_time=false
      penalty_amount = 0

      self.movie_rents.each do |item |
        penalty_amount+= item.movie.delayed_return_penalty_amount*delayed_return_days
      end

      self.delayed_rental_penalty_amount = penalty_amount

      self.total_to_pay = rental_total_ammount + delayed_rental_penalty_amount

      self.save
    end
  end

end

# == Schema Information
#
# Table name: rents
#
#  id                            :bigint           not null, primary key
#  user_id                       :bigint
#  status                        :integer          default("pending")
#  rental_end_date               :date
#  rental_return_date            :date
#  return_on_time                :boolean          default(TRUE)
#  delayed_return_days           :integer          default(0)
#  rental_total_ammount          :decimal(5, 1)    default(0.0)
#  delayed_rental_penalty_amount :decimal(5, 1)    default(0.0)
#  total_to_pay                  :decimal(5, 1)    default(0.0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_rents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
