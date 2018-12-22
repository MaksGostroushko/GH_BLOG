require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it "check the user's create" do
    # pending "false <-> true"
    @user = User.new(name: "Max", email: "max@gmail.com", password: "1qwerty", password_confirmation: "1qwerty")
    expect(@user.valid?).to be false
  end

  it "check the user's admin" do
    @user = User.new(name: "Max", email: "max@gmail.com", password: "1qwerty", password_confirmation: "1qwerty")
    expect(@user.admin).to be false
  end

end
