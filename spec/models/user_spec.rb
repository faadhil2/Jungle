require 'rails_helper'

RSpec.describe User, type: :model do

describe 'Validation' do

  it 'should be created with a password and password_confirmation' do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    expect(@user.password).to be_present
    expect(@user.password_confirmation).to be_present
  end

  it 'should have a matching password and password_confirmation' do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    expect(@user.password).to eq(@user.password_confirmation)
  end

  it 'should have a unique email: not case-sensitive' do
    user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    clone = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    
    user.save
    clone.save
    
    expect(clone).to be_invalid
  end

  it 'should have a email, first name, and last name' do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    expect(@user.email).to be_present
    expect(@user.first_name).to be_present
    expect(@user.last_name).to be_present
  end

  it 'the password must have a minimum length when a user account is being created' do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "t", password_confirmation: "t")
    expect(@user).to be_invalid
  end

end


describe '.authenticate_with_credentials' do
  # examples for this class method here
  it "Log user in if credentials match" do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    @user.save!
    expect(User.authenticate_with_credentials("janedoe@email.com", "test")).to be_present
  end

  it "Do not log user in if email is wrong" do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    @user.save!
    expect(User.authenticate_with_credentials("jane@email.com", "test")).to be_nil
  end

  it "should not log user in if password is wrong" do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    @user.save!
    expect(User.authenticate_with_credentials("janedoe@email.com", "wrong password")).to be_nil
  end

  it "should not log user in if email constains spaces" do
    @user = User.new(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "test", password_confirmation: "test")
    @user.save!
    expect(User.authenticate_with_credentials("   janedoe@email.com   ", "test")).to be_present
  end



end

end
