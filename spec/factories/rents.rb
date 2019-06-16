FactoryBot.define do
  factory :rent do
    trait :full do
      user { FactoryBot.create(:user) }
      status { 0 }
      rental_end_date { "2019-06-15" }
      rental_return_date { "2019-06-11" }
      return_on_time { false }
      delayed_return_days { 0 }
      rental_total_ammount { 9.99 }
      delayed_rental_penalty_amount { 9.99 }
      total_to_pay { 19.98 }
      before :create do |rent|
        create_list :movie_rent, 1, rent: rent
      end
    end

    trait :empty do
      user { FactoryBot.create(:user) }
      status { 0 }
      total_to_pay { nil }
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
