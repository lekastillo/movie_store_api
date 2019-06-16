class MovieUpdateSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :field, :previus_value, :movie_id


end

# == Schema Information
#
# Table name: movie_updates
#
#  id            :bigint           not null, primary key
#  field         :string
#  previus_value :text
#  movie_id      :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_id      :bigint
#
# Indexes
#
#  index_movie_updates_on_admin_id  (admin_id)
#  index_movie_updates_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_id => admins.id)
#  fk_rails_...  (movie_id => movies.id)
#
