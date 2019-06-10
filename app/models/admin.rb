class Admin < ApplicationRecord
  validates :full_name, :email, presence: true
  validates :email, uniqueness: true
end

# == Schema Information
#
# Table name: admins
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
