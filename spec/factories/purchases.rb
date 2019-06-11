FactoryBot.define do
  factory :purchase do
    trait :full do
      user { FactoryBot.create(:user) }
      total_amount { 9.99 }
      before :create do |purchase|
        create_list :movie_purchase, 1, purchase: purchase
      end
    end

    trait :empty do
      user { nil }
      total_amount { 0 }

    end
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
