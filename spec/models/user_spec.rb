require 'rails_helper'

RSpec.describe User, type: :model do
  it "does not valid wih duplicate email" do
    user = FactoryBot.create(:user)

    user2 = FactoryBot.build(:user, full_name: 'Luis')

    expect(user2).to_not be_valid

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
