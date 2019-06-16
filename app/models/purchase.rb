class Purchase < ApplicationRecord
  paginates_per 10
  belongs_to :user
  has_many :movie_purchases, dependent: :delete_all

  validates :user_id, presence: true
  accepts_nested_attributes_for :movie_purchases, reject_if: proc { |attributes| attributes['quantity'].blank? }

  validate :validate_unique_movie_purchase
  def validate_unique_movie_purchase
    #the second argument is an array so it can take multiple fields
    validate_uniqueness_of_in_memory(movie_purchases, [:movie_id], 'Movie already exists')
  end

end

# == Schema Information
#
# Table name: purchases
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  total_amount :decimal(5, 1)    default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_purchases_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
