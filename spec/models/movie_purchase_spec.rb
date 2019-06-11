require 'rails_helper'

# RSpec.describe MoviePurchase, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# == Schema Information
#
# Table name: movie_purchases
#
#  id          :bigint           not null, primary key
#  purchase_id :bigint
#  movie_id    :bigint
#  quantity    :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_movie_purchases_on_movie_id     (movie_id)
#  index_movie_purchases_on_purchase_id  (purchase_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (purchase_id => purchases.id)
#
