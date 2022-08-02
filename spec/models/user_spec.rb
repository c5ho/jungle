require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @new_user = User.new({
      firstname: 'Calvin',
      lastname: 'Hobbes',
      email: 'blah@blah.com',
      password: '12345',
      password_confirmation: '12345'
    })
    @new_user.save!
  end
  
  # These validations are for new user creation
  describe 'validations' do
    
    it 'should be successfull when all fields are valid' do
      expect(@new_user).to be_valid
    end

    it 'should not be successfull when missing firstname' do
      @new_user.firstname = nil
      expect(@new_user).not_to be_valid
      expect(@new_user.errors.messages[:firstname]).to include('can\'t be blank')
    end

    it 'should not be successfull when missing lastname' do
      @new_user.lastname = nil
      expect(@new_user).not_to be_valid
      expect(@new_user.errors.messages[:lastname]).to include('can\'t be blank')
    end

    it 'should not be successfull when missing email' do
      @new_user.email = nil
      expect(@new_user).not_to be_valid
      expect(@new_user.errors.messages[:email]).to include('can\'t be blank')
    end

    it 'should not be successfull when white spaces in email' do
      @new_user.email = '         blah@blah.com   '
      expect(@new_user).not_to be_valid
      expect(@new_user.errors.messages[:email]).to include('is invalid')
    end
    
    it 'should not be successfull when password confirmation is blank' do
      @new_user.password_confirmation = ''
      expect(@new_user).not_to be_valid
      expect(@new_user.errors.messages[:password_confirmation]).to include('doesn\'t match Password')    
    end

    it 'should not be successfull when email is not unique' do
      another_new_user = User.new({
        firstname: 'John',
        lastname: 'Doe',
        email: 'BLAH@blah.com',
        password: '12345',
        password_confirmation: '12345'
      })
      another_new_user.save

      expect(@new_user).to be_valid
      expect(another_new_user).not_to be_valid
      expect(another_new_user.errors.messages[:email]).to include('has already been taken')
    end

    it 'should not be successfull when password length is less than 5 characters' do
      @new_user.password = '1234'
      expect(@new_user).not_to be_valid
      # use match to match a substring within a string
      expect(@new_user.errors.messages[:password]).to include(match(/is too short/))
    end
  end

  # These validations are for user login
  describe 'authentications' do

    it 'should be successfull if password and email are valid' do
      valid_user = User.authenticate_with_credentials('blah@blah.com', '12345')
      expect(valid_user).to eq(@new_user)
    end
  
    it 'should not be successful if password is wrong' do
      invalid_user = User.authenticate_with_credentials('blah@blah.com', '123456')
      expect(invalid_user).to_not eq(@new_user)
    end

    it 'should not be successful if email is wrong' do
      invalid_user = User.authenticate_with_credentials('bla@blah.com', '12345')
      expect(invalid_user).to_not eq(@new_user)
    end
  
    it 'should be successful if user adds uppercase letters to their email' do
      valid_user = User.authenticate_with_credentials('Blah@BLAH.com', '12345')
      expect(valid_user).to eq(@new_user)
    end

    it 'should authenticate if user adds spaces to beginning or end of email' do
      valid_user = User.authenticate_with_credentials('      blah@blah.com ', '12345')
      expect(valid_user).to eq(@new_user)
    end
    
  end
end
