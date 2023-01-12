require 'rails_helper'

RSpec.feature 'Trasaction Page:', type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '12345678',
                        password_confirmation: '12345678')

    visit new_user_session_path
    within('#session') do
      fill_in 'Email', with: 'peter@gmail.com'
      fill_in 'Password', with: '12345678'
    end
    click_button 'Log in'

    @category = Category.new(name: 'Gudgets', icon: 'alarm.svg')
    @category.user = @user
    @category.save
    visit category_path(@category)
    click_link 'NEW TRANSACTION'
  end

  context 'Expenes Page: ' do
    it 'can view Expense creation page' do
      expect(page).to have_current_path(new_expense_path)
    end

    it 'Expense contains "text-input"  ' do
      expect(page).to have_css("input[type*='text']")
    end

    it 'Expense contains details "name"' do
      expect(page).to have_css("input[type*='number']")
    end
  end
end
