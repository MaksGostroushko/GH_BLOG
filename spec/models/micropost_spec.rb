require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) { create(:user)}
  # let(:micropost) { create(:micropost, user: user)}

  it "post's content should be present" do
    # debugger
    # @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    @micropost = user.microposts.build(content: "", title: "Title")
    expect(@micropost.valid?).to be false
  end

  it "post's content shouldn't be too short" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    @micropost = @user.microposts.build(content: "Content < 25 symbols", title: "Title")
    expect(@micropost.valid?).to be false
  end

  it "post's content shouldn't be blank" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    @micropost = @user.microposts.build(content: " " * 25, title: "Title")
    expect(@micropost.valid?).to be false
  end

  it "title should be present" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    @micropost = @user.microposts.build(content: "It content specail from this test", title: "")
    expect(@micropost.valid?).to be false
  end

  it "title shouldn't be too short" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    @micropost = @user.microposts.build(content: "It content specail from this test", title: "q")
    expect(@micropost.valid?).to be false
  end

  it "title shouldn't be blank" do
    @user = User.new(name: "Max", email: "maxnew@gmail.com", password: "123456")
    @micropost = @user.microposts.build(content: "It content specail from this test", title: " " * 10)
    expect(@micropost.valid?).to be false
  end
end
