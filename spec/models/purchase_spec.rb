require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "is invalid with emtpy attributes" do
    purchase = FactoryBot.build(:purchase, :empty)

    expect(purchase).to_not be_valid
  end

  it "is valid with attributes" do
    purchase = FactoryBot.build(:purchase, :full)

    expect(purchase).to be_valid
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
