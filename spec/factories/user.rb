FactoryBot.define do
  factory :user do
    factory :first_user, class: User do
      id{'1'}
      name {'specuser01'}
      email {'specuser01@gmail.com'}
      password {'password'}
      password_confirmation {'password'}
    end
  end
end
