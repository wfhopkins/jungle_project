require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should have a password and password confirmation" do
      @user = User.new(
        name: 'Johnny Test',
        email: 'johnny@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      @user.valid?
      expect(@user).to be_valid
    end

    it "should return an error if the password is invalid" do
      @user = User.new(
        name: 'Johnny Test',
        email: 'johnny@test.com',
        password: '',
        password_confirmation: 'test123'
      )
      @user.valid?
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should return an error if the password and password_confirmation don't match" do
      @user = User.new(
        name: 'Johnny Test',
        email: 'johnny@test.com',
        password: 'test123',
        password_confirmation: 'fails456'
      )
      @user.valid?
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should return an error if the password is too short (pw < 4)" do
      @user = User.new(
        name: 'Johnny Test',
        email: 'johnny@test.com',
        password: 't1',
        password_confirmation: 't1'
      )
      @user.valid?
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

    describe 'Validations for existing users in db' do
      before do
        @user_already_present = User.create(
          name: 'Johnny Test',
          email: 'johnny@test.com',
          password: 'test123',
          password_confirmation: 'test123'
        )
      end

      it "should return an error if email already exists" do
        @user_new = User.new(
          name: 'Johnny Test',
          email: 'johnny@test.com',
          password: 'test123',
          password_confirmation: 'test123'
        )
        expect(@user_new).not_to be_valid
        expect(@user_new.errors.full_messages).to include("Email has already been taken")
      end

      it "should return an error if the email matches an existing email, regardless of case" do
        @user_new = User.new(
          name: 'Johnny Test',
          email: 'JohNNy@TesT.COM',
          password: 'test123',
          password_confirmation: 'test123'
        )
        expect(@user_new).not_to be_valid
        expect(@user_new.errors.full_messages).to include("Email has already been taken")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        name: 'Johnny Test',
        email: 'johnny@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
    end

    it "should return user when authentication is valid" do
      user = User.authenticate_with_credentials('johnny@test.com', 'test123')
      expect(user).to eql(@user)
    end

    it "should return nil when authentication is invalid" do
      user = User.authenticate_with_credentials('johnny@test.com', 'fails456')
      expect(user).to eql(nil)
    end

    it "should return user regardless of casing" do
      user = User.authenticate_with_credentials('JohNNy@TesT.COM', 'test123')
      expect(user).to eql(@user)
    end

    it "should return user regardless of extra trailing or leading spaces in input" do
      user = User.authenticate_with_credentials('  johnny@test.com ', 'test123')
      expect(user).to eql(@user)
    end

    it "should return user regardless of spacing and case" do
      user = User.authenticate_with_credentials(' JohNNy@TesT.COM  ', 'test123')
      expect(user).to eql(@user)
    end
  end
end
