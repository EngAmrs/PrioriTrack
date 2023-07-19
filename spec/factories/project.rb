FactoryBot.define do
    factory :project do
      association :user, factory: :user
    end
  end
  