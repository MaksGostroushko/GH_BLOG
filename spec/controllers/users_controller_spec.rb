require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user)}

  it "check the user's admin" do
    expect(user.admin).to be false
  end
end
