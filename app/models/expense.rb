class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, 
                     numericality: { only_integer: true, greater_than_or_equal_to: 0}
 
  has_many :category_expenses, foreign_key: 'expense_id', dependent: :destroy          
  belongs_to :user, foreign_key: 'author_id'
  has_many :categories, through: :category_expenses
end
