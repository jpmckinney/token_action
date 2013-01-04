# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :token, class: TokenAction::Token do
    kind 'Cat'
  end
end
