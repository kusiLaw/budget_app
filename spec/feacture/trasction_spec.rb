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
  end

  context 'Transaction Page: ' do
    it 'Can view transaction' do
      expect(page).to have_current_path(category_path(@category))
    end

    it 'contains Category details "name"' do
      expect(page).to have_content @category.name
    end

    it 'click link to create transaction' do
      click_link 'NEW TRANSACTION'
      expect(page).to have_current_path(new_expense_path)
    end
  end
end
