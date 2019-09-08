# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    id{'2'}
    title { 'test02' }
    details { 'samplesample' }
    deadline { '2019/09/10' }
    priority { '99' }
    status { 'Factoryで作ったデフォルトのコンテント１' }
    created_at {'2019/10/05 00:00:00'}
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    id{'3'}
    title { 'test03' }
    details { 'Factoryで作ったデフォルトのコンテント2' }
    deadline { '2019/08/26' }
    priority { '99' }
    status { 'Factoryで作ったデフォルトのコンテント2' }
    created_at {'2019/10/06 00:00:00'}
  end
  factory :third_task, class: Task do
    id{'4'}
    title { 'test04' }
    details { 'Factoryで作ったデフォルトのコンテント3' }
    deadline { '2019/08/26' }
    priority { '99' }
    status { 'Factoryで作ったデフォルトのコンテント3' }
    created_at {'2019/10/07 00:00:00'}
  end

  factory :task_another, class: Task do
    id{'5'}
    title { 'test05' }
    details { 'Factoryで作ったデフォルトのコンテント2' }
    deadline { '2019/08/26' }
    priority { '99' }
    status { 'Factoryで作ったデフォルトのコンテント１' }
    created_at {'2019/10/08 00:00:00'}
  end
end
# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
    FactoryBot.create(:task_another)
  end
  scenario "タスク一覧のテスト" do
      # tasks_pathにvisitする（タスク一覧ページに遷移する）
      visit tasks_path

      # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
      # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
      expect(page).to have_content 'test02'
      expect(page).to have_content 'test03'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task[title]', with: 'test01'
    fill_in 'task[details]', with: 'test01_詳細'
    fill_in 'task[deadline]', with: '2019/08/08'
    select '99', from: 'task[priority]'
    fill_in 'task[status]', with: '未着手'
    click_on 'Create Task'
    expect(page).to have_content 'test01'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(5)
    expect(page).to have_content 'test05'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    tasks = page.all('.title')

    expect(tasks[0]).to have_content 'test05'
    expect(tasks[1]).to have_content 'test04'
    expect(tasks[2]).to have_content 'test03'
    expect(tasks[3]).to have_content 'test02'
  end
end
