FactoryBot.define do
  factory :admin do
    full_name { "John Doe" }
    email { "johndoe@email.com" }
  end
end

# == Schema Information
#
# Table name: admins
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
