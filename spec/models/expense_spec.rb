require 'rails_helper'

RSpec.describe Expense, type: :model do

  before :each do
   @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '12345678', password_confirmation: '12345678')
   @expense = Expense.new(name: 'food', amount: '5')
   @expense.user = @user
  end

  context 'Validations:' do
    it 'Expenses with name empty ' do
     @expense.name = ''
     @expense.save
      expect(@expense).to_not be_valid
    end

    it 'Expenses with amount nil' do
       @expense.amount = nil
       @expense.save
      expect(@expense).to_not be_valid
    end
  end

end
