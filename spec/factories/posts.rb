# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    post "MyPost"
    link "MyText"
    votes 1
    # comment
  end
end
