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
#  id                     :bigint           not null, primary key
#  full_name              :string
#  email                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
