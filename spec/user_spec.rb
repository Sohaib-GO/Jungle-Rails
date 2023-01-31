require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    let(:user) {
      User.create(name: "Sohaib", email: "example@gmail.com", password: "password", password_confirmation: "password")
    }

    it "should save successfully" do
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a password confirmation" do
      user.password_confirmation = nil
      expect(user).to_not be_valid
    end

    it "is not valid if password and password confirmation do not match" do
      user.password_confirmation = "password1"
      expect(user).to_not be_valid
    end

    it "should not allow duplicate email addresses regardless of case" do
      user1 = User.create(name: "Sohaib", email: "example@gmail.com", password: "password", password_confirmation: "password")
      user2 = User.create(name: "Sohaib", email: "EXAMPLE@gmail.COM", password: "password", password_confirmation: "password")
      expect(user2).to_not be_valid
    end

    it "should not allow password length less than 3 characters" do
      user.password = "12"
      expect(user).to_not be_valid
    end

    it "lets the user log in even if they type in a few spaces before and/or after their email address" do
      user = User.create(name: "Sohaib", email: "example@gmail.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials(" example@gmail.com ", "password")
      expect(authenticated_user).to eq(user) 
    end
        
    end
end
