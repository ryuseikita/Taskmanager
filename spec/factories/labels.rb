FactoryBot.define do
  factory :label01,class: Label do
    id{10}
    name { "ラベルテスト001" }
  end
  factory :label02,class: Label do
    id{11}
    name { "ラベルテスト002" }
  end
  factory :label03,class: Label do
    id{12}
    name { "ラベルテスト003" }
  end
end
