class CreateCategoriesExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_expenses do |t|
     t.belongs_to :category, null: false
     t.belongs_to :expense, null: false

      t.timestamps
    end
    add_foreign_key :categories_expenses, :categories
    add_foreign_key :categories_expenses, :expenses
  end
end
