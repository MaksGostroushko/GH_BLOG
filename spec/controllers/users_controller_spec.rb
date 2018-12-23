require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it "check user's valid" do
    @user = User.new(name: "Max", email: "maxon@gmail.com", password: "123456")
    expect(@user.valid?).to be true
  end

  it "check the user's admin" do
    @user = User.new(name: "Max", email: "max@gmail.com", password: "1qwerty")
    expect(@user.admin).to be false
  end

  it "should redirect index when not logged in" do
    pending("Not finish yet")
    @user = User.new(name: "Max", email: "maxon@gmail.com", password: "123456")
    get :users_path
    expect(respons).to redirect_to(login_url)
  end

end
