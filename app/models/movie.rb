class Movie < ApplicationRecord
  paginates_per 10
  has_many :movie_updates
  has_many :user_favorite_movies
  include AASM
  include PgSearch

  has_many_attached :covers
  validates :title, :description, :status, :stock, :rental_price, :sale_price, :delayed_return_penalty_amount, presence: true
  validates :stock, numericality: { only_integer: true, greater_than: 0 }, on: :create
  validates :rental_price, :sale_price, :delayed_return_penalty_amount, numericality: { greater_than: 0 }, on: :create

  attr_accessor :admin_id

  enum status: [:available, :unavailable]

  scope :by_title, ->(direction) { order title: direction }
  scope :by_popularity, ->(direction) { order user_favorite_movies_count: direction }

  pg_search_scope :search, against: :title, using: { tsearch: { prefix: true } }

  aasm :column => :status, :enum => true do
    state :available, :initial => true
    state :unavailable

    event :enable do
      transitions :from => :unavailable, :to => :available
    end

    event :disable do
      transitions :from => :available, :to => :unavailable
    end
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
