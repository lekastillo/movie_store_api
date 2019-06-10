class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :stock, :rental_price, :sale_price, :delayed_return_penalty_amount
end

# == Schema Information
#
# Table name: movies
#
#  id                            :bigint           not null, primary key
#  title                         :string
#  description                   :text
#  status                        :integer          default(0)
#  stock                         :integer          default(0)
#  rental_price                  :decimal(5, 1)    default(0.0)
#  sale_price                    :decimal(5, 1)    default(0.0)
#  delayed_return_penalty_amount :decimal(5, 1)    default(0.0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
