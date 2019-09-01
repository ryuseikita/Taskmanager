# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
      Task.create!(title:'testtesttest' ,details: 'テスト00_詳細', deadline: '2019/08/26', priority: '0',status:'未着手')
      Task.create!(title:'samplesample' ,details: 'テスト00_詳細', deadline: '2019/08/26', priority: '0',status:'未着手')

      # tasks_pathにvisitする（タスク一覧ページに遷移する）
      visit tasks_path

      # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
      # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
      expect(page).to have_content 'testtesttest'
      expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task[title]', with: 'test01'
    fill_in 'task[details]', with: 'test01_詳細'
    fill_in 'task[deadline]', with: '2019/08/08'
    fill_in 'task[priority]', with: '99'
    fill_in 'task[status]', with: '未着手'

    click_on 'Create Task'
    expect(page).to have_content 'test01'

  end

  scenario "タスク詳細のテスト" do
    Task.create!(title:'test04' ,details: 'テスト44_詳細', deadline: '2019/08/26', priority: '0',status:'未着手')
    visit task_path(4)
    expect(page).to have_content 'test04'
  end
end
