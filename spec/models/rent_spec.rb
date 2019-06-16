require 'rails_helper'

RSpec.describe Rent, type: :model do
  it "is invalid with emtpy attributes" do
    rent = FactoryBot.build(:rent, :empty)

    expect(rent).to_not be_valid
  end

  it "is valid with attributes" do
    rent = FactoryBot.build(:rent, :full)

    expect(rent).to be_valid
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
