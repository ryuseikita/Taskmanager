require 'rails_helper'
# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:first_user)
    FactoryBot.create(:task)
    FactoryBot.create(:zero_task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
    FactoryBot.create(:task_another)
    FactoryBot.create(:quattro_task)
    FactoryBot.create(:label01)
    FactoryBot.create(:label02)
    FactoryBot.create(:label03)
    FactoryBot.create(:tag01)
    FactoryBot.create(:tag02)
    FactoryBot.create(:tag03)
    visit tasks_path
    fill_in 'session[email]', with: 'specuser02@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
  end
  scenario "タスク一覧のテスト" do
      visit tasks_path
      expect(page).to have_content 'test02'
      expect(page).to have_content 'test03'
  end
  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task[title]', with: 'test01'
    fill_in 'task[details]', with: 'test01_詳細'
    fill_in 'task[deadline]', with: '2019/08/01'
    select '高', from: 'task[priority]'
    select '未着手', from: 'task[status]'
    click_on '登録する'
    expect(page).to have_content 'test01'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(13)
    expect(page).to have_content 'test05'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    tasks = page.all('.title_content')
    expect(tasks[0]).to have_content 'test06'
    expect(tasks[1]).to have_content 'test05'
    expect(tasks[2]).to have_content 'test04'
    expect(tasks[3]).to have_content 'test03'
    expect(tasks[4]).to have_content 'test02'
  end

  scenario "タスクが終了期限の降順に並んでいるかのテスト" do
    visit tasks_path
    click_on '終了期限でソートする'
    tasks = page.all('.deadline')
    expect(tasks[0]).to have_content '9月04日'
    expect(tasks[1]).to have_content '9月03日'
    expect(tasks[2]).to have_content '9月02日'
    expect(tasks[3]).to have_content '9月01日'
  end

  scenario "タスクのステータス検索ができるかのテスト(未着手のみの表示)" do
    visit tasks_path
    # fill_in 'Status search', with: '未着手'
    select '未着手', from: 'task[status]'
    click_on '検索する'
    tasks = page.all('.title_content')
    expect(tasks[0]).to have_content 'test04'
    expect(tasks[1]).to have_content 'test03'
    expect(tasks[2]).to have_content ''
    expect(tasks[3]).to have_content ''
  end
  scenario "タスクのタイトル検索ができるかのテスト" do
    visit tasks_path
    fill_in 'task[title]', with: 'test05'
    click_on '検索する'
    tasks = page.all('.title_content')
    expect(tasks.length).to eq 1
    expect(tasks[0]).to have_content 'test05'
  end

  scenario "タスクのステータス検索ができるかのテスト" do
    visit tasks_path
    select '未着手', from: 'task[status]'
    click_on '検索する'
    tasks = page.all('.title_content')
    expect(tasks.length).to eq 2
    expect(tasks[0]).to have_content 'test04'
    expect(tasks[1]).to have_content 'test03'
  end

  scenario "タスクのタイトルとステータスの同時検索ができるかのテスト" do
    visit tasks_path
    fill_in 'task[title]', with: 'test0'
    select '完了', from: 'task[status]'
    click_on '検索する'
    tasks = page.all('.title_content')
    expect(tasks.length).to eq 2
    expect(tasks[0]).to have_content 'test05'
    expect(tasks[1]).to have_content 'test02'
  end

  scenario "タスクが優先順位に並んでいるかのテスト" do
    visit tasks_path
    click_on '優先順位でソートする'
    tasks = page.all('.priority')
    expect(tasks[0]).to have_content '高'
    expect(tasks[1]).to have_content '高'
    expect(tasks[2]).to have_content '中'
    expect(tasks[3]).to have_content '中'
    expect(tasks[4]).to have_content '低'
  end

  scenario "ページネーションが適用できているかテスト" do
    visit tasks_path
    click_on '2'
    tasks = page.all('.title_content')
    expect(tasks.length).to eq 1
    expect(tasks[0]).to have_content 'test00'
  end

  scenario "タスクの作成時にラベルを付与できること" do
    visit new_task_path

    fill_in 'task[title]', with: 'test02'
    fill_in 'task[details]', with: 'test02_詳細'
    fill_in 'task[deadline]', with: '2019/08/01'
    select '高', from: 'task[priority]'
    select '未着手', from: 'task[status]'
    check 'ラベルテスト003'
    click_on '登録する'
    visit task_path(2)
    expect(page).to have_content 'ラベルテスト003'
  end

  scenario "タスクのラベル検索ができていることを確認する。" do
    visit tasks_path
    select '2', from: 'task[label]'
    click_on '検索する'
    tasks = page.all('.title_content')
    expect(tasks.length).to eq 2
    expect(tasks[0]).to have_content 'test03'
    expect(tasks[1]).to have_content 'test02'
  end

  scenario "タスクのタイトル＆優先度＆ラベル検索ができていることを確認する。" do
    visit tasks_path
    fill_in 'task[title]', with: 'test'
    select '完了', from: 'task[status]'
    select '2', from: 'task[label]'
    click_on '検索する'
    tasks = page.all('.title_content')
    expect(tasks.length).to eq 1
    expect(tasks[0]).to have_content 'test02'
  end
  
  # save_and_open_page
end
