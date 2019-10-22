FactoryBot.define do
  factory :user do
    factory :first_user, class: User do
      id{'2'}
      name {'specuser02'}
      email {'specuser02@gmail.com'}
      password {'password'}
      password_confirmation {'password'}
    end
    factory :second_user, class: User do
      id{'3'}
      name {'specuser03'}
      email {'specuser03@gmail.com'}
      password {'password'}
      password_confirmation {'password'}
    end
  end
end
