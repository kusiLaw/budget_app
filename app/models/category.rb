class Category < ApplicationRecord

 validates :name, presence: true, length: { maximum: 35, minimum: 2}, uniqueness: true
 validates :icon, presence: true

  ICONS = %i[alarm calls database droplet energy fare fire food fuel health
             mic-fill mortarboard rent tools personal container ].freeze
end
