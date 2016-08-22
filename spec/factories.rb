FactoryGirl.define do
  factory :user do    
    sequence(:email) { |n| "person_#{n}@test.com"}
    password "123123"
  end

  factory :list do
    sequence(:title) { |n| "List-#{n}" }
    sequence(:descriotion) { |n| "List_description-#{n}" }
    user
  end

  factory :task do
    sequence(:content) { |n| "Task-#{n}" }
    list
  end

end