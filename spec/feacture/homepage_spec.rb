require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  before :each do
     @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '12345678', password_confirmation: '12345678')
     # visit new_user_session_path
  end

  context 'Login direct to homepage(category): ' do

   it "signs me in" do
   visit new_user_session_path
   within("#session") do
     fill_in 'Email', with: 'peter@gmail.com'
     fill_in 'Password', with: '12345678'
   end
   click_button 'Log in'
   expect(page).to have_current_path(categories_path)
   
   end
  end



end