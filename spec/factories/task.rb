FactoryBot.define do
    factory :task do
      id{'10'}
      title { 'test02' }
      details { 'test02_details' }
      deadline { '2019/09/01' }
      priority { 'low' }
      status { '完了' }
      created_at {'2019/10/05 00:00:00'}
      user_id {'10'}
    end
    factory :second_task, class: Task do
      id{'11'}
      title { 'test03' }
      details { 'test03_details' }
      deadline { '2019/09/03' }
      priority { 'middle' }
      status { '未着手' }
      created_at {'2019/10/06 00:00:00'}
      user_id {'10'}
    end
    factory :third_task, class: Task do
      id{'12'}
      title { 'test04' }
      details { 'test04_details' }
      deadline { '2019/09/04' }
      priority { 'high' }
      status { '未着手' }
      created_at {'2019/10/07 00:00:00'}
      user_id {'10'}
    end
  
    factory :task_another, class: Task do
      id{'13'}
      title { 'test05' }
      details { 'test05_details' }
      deadline { '2019/09/02' }
      priority { 'middle' }
      status { '完了' }
      created_at {'2019/10/08 00:00:00'}
      user_id {'10'}
    end
    factory :quattro_task, class: Task do
      id{'14'}
      title { 'test06' }
      details { 'test06_details' }
      deadline { '2019/09/01' }
      priority { 'high' }
      status { '着手' }
      created_at {'2019/10/09 00:00:00'}
      user_id {'10'}
    end
    factory :zero_task, class: Task do
      id{'15'}
      title { 'test00' }
      details { 'test00_details' }
      deadline { '2019/08/30' }
      priority { 'low' }
      status { '着手' }
      created_at {'2019/7/01 00:00:00'}
      user_id {'10'}
    end
end