#   @user = User.new{name: "Max", email: "maxnew@gmail.com", password: "123456"}
FactoryBot define do
  factory :micropost do
    title { "Title" }
    content { "Content should be greater than 25 " }
  end
end
