require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "does not valid wih duplicate email" do
    admin = FactoryBot.create(:admin)

    admin2 = FactoryBot.build(:admin, full_name: 'Luis')

    expect(admin2).to_not be_valid

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
