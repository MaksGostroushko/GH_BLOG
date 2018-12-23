#   @user = User.new{name: "Max", email: "maxnew@gmail.com", password: "123456"}
FactoryBot.define do
  factory :user do
    name { "Max" }
    email { "maxnew@gmail.com" }
    password { "123456" }
  end
end
