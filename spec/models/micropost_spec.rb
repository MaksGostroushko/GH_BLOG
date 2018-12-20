require 'rails_helper'

RSpec.describe Micropost, type: :model do

  it "check micropost valid" do
    @micropost = Micropost.new(content: "Content < 25 symbols", title: "Title")
    expect(@micropost.valid?).to be false
  end
end
