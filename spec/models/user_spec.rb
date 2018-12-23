require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "check to user's parameters" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    expect(@user.valid?).to be true
  end

  it "name should be present" do
    @user = User.new(name: "", email: "maxnew@gmail.com", password: "123456")
    expect(@user.valid?).to be false
  end

  it "email should be present" do
    @user = User.new(name: "Max", email: "", password: "123456")
    expect(@user.valid?).to be false
  end

  it "email should be write in correct form" do
    @user = User.new(name: "Max", email: "123%.om", password: "123456")
    expect(@user.valid?).to be false
  end

  it "user's email should be unique" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user.valid?).to be false
  end

  it "password should be present" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "")
    expect(@user.valid?).to be false
  end

  it "password should be present(nonblank)" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: " " * 6)
    expect(@user.valid?).to be false
  end

  it "password shouldn't be too short(min:6 symbols)" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "1")
    expect(@user.valid?).to be false
  end

end
