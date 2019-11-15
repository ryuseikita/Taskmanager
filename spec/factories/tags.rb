FactoryBot.define do
  factory :tag01,class: Tag do
    task_id { 10 }
    label_id { 10 }
  end
  factory :tag02,class: Tag do
    task_id { 10 }
    label_id { 11 }
  end
  factory :tag03,class: Tag do
    task_id { 11 }
    label_id { 11 }
  end
  factory :tag04,class: Tag do
    task_id { 12 }
    label_id { 12 }
  end
end
