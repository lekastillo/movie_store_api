class RentSerializer < ActiveModel::Serializer
  has_many :movie_rents
  belongs_to :user
  attributes :id, :user, :status, :total_to_pay, :rental_end_date, :rental_days, :rental_return_date, :return_on_time, :delayed_return_days, :rental_total_ammount, :delayed_rental_penalty_amount, :movie_rents

  def rental_days
    object.rental_days
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
