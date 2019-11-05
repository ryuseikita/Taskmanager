FactoryBot.define do
  factory :user do
    factory :first_user, class: User do
      id{'10'}
      name {'specuser02'}
      email {'specuser02@gmail.com'}
      password {'password'}
      password_confirmation {'password'}
      admin{'false'}
    end
    factory :second_user, class: User do
      id{'11'}
      name {'specuser03'}
      email {'specuser03@gmail.com'}
      password {'password'}
      password_confirmation {'password'}
      admin{'true'}
    end
  end
end
