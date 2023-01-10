class Category < ApplicationRecord

 validates :name, presence: true, length: { maximum: 35, minimum: 2}, uniqueness: true
 validates :icon, presence: true

 belongs_to :user,  foreign_key: 'author_id'
 has_many :category_expenses, foreign_key: 'category_id', dependent: :destroy
 has_many :expenses, through: :category_expenses

 ICONS = %i[alarm calls database droplet energy fare fire food fuel health
             mic-fill mortarboard rent tools personal container ].freeze
end
