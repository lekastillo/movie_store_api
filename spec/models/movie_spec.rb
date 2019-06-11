require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with valid attributes" do
    movie = FactoryBot.build(:movie, :full)
    expect(movie).to be_valid
  end

  it "is not valid without a valid attribute" do
    movie = FactoryBot.build(:movie, :empty)

    expect(movie).to_not be_valid, lambda { factory.errors.full_messages.join("\n") }
  end

  it "is not valid with stock > 0" do
    movie = FactoryBot.build(:movie, :full, stock: -1)
      expect(movie).to_not be_valid
  end

  it "is not valid with rental_price > 0 or sale_price > 0" do
    movie = FactoryBot.build(:movie, :full, rental_price: 0, sale_price: 0)
    expect(movie).to_not be_valid
  end

  it "is valid with rental_price > 0 or sale_price > 0" do
    movie = FactoryBot.build(:movie, :full, rental_price: 0.5, sale_price: 2.5)
    expect(movie).to be_valid
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
#  user_favorite_movies_count    :integer          default(0)
#
