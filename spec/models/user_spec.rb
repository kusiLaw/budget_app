require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Peter', email: 'peter@gmail.com', password: '12345678', password_confirmation: '12345678')
  end

  context 'Sign Up:' do
    it 'User has no valid emai' do
     @user.email = 'pet'
     @user.save
     expect(@user).to_not be_valid
    end

    it 'User with valid attribute' do
      expect(@user).to be_valid
    end

    it 'User password less than the lenght' do
      @user.password = 'laky'
    
      expect(@user).to_not be_valid
    end

    it 'User name should match input' do
     @user.save
     expect(@user.name).to eql 'Peter'
   end
  end

end
