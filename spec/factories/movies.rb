# spec/factories/movies.rb
FactoryBot.define do
  factory :movie do
    trait :full do
      title { "The goodfather" }
      description { "MyText" }
      status { 1 }
      stock { 1 }
      rental_price { "9.99" }
      sale_price { "9.99" }
      delayed_return_penalty_amount { "9.99" }
    end

    trait :empty do
      title { nil }
      description { nil }
      status { nil }
      stock { nil }
      rental_price { nil }
      sale_price { nil }
      delayed_return_penalty_amount { nil }
    end
  end
end

# == Schema Information
#
# Table name: movies
#
#  id                            :bigint           not null, primary key
#  title                         :string
#  description                   :text
#  status                        :integer          default("available")
#  stock                         :integer          default(0)
#  rental_price                  :decimal(5, 1)    default(0.0)
#  sale_price                    :decimal(5, 1)    default(0.0)
#  delayed_return_penalty_amount :decimal(5, 1)    default(0.0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
