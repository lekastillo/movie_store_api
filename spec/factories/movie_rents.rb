FactoryBot.define do
  factory :movie_rent do
    movie { FactoryBot.create(:movie, :full) }
    quantity { 1 }
  end
end

# == Schema Information
#
# Table name: movie_rents
#
#  id         :bigint           not null, primary key
#  rent_id    :bigint
#  movie_id   :bigint
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movie_rents_on_movie_id  (movie_id)
#  index_movie_rents_on_rent_id   (rent_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (rent_id => rents.id)
#
