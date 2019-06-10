FactoryBot.define do
  factory :user do
    full_name { "Mat Tylor" }
    email { "mtylor@email.com" }
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
