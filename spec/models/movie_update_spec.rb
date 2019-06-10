require 'rails_helper'

RSpec.describe MovieUpdate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
#
# Indexes
#
#  index_movie_updates_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
