class PurchaseSerializer < ActiveModel::Serializer
  has_many :movie_purchases
  belongs_to :user
  attributes :id, :user, :total_amount, :movie_purchases

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
