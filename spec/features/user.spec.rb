require 'rails_helper'
RSpec.feature "ユーザ機能", type: :feature do
  background do
    FactoryBot.create(:first_user)
    FactoryBot.create(:second_user)
  end
  scenario "ログインできることを確認" do
      visit tasks_path
      fill_in 'session[email]', with: 'specuser02@gmail.com'
      fill_in 'session[password]', with: 'password'
      click_on 'ログイン'
      expect(page).to have_content 'specuser02'
  end

  scenario "ログイン時のパスワードが間違っていた場合再度ログイン画面に戻ること" do
    visit tasks_path
    fill_in 'session[email]', with: 'specuser02@gmail.com'
    fill_in 'session[password]', with: '###'
    click_on 'ログイン'
    expect(page).to have_content 'ログイン'
  end
  scenario "新しいアカウントの作成ができること" do
    visit tasks_path
    click_on '新しいアカウントの作成'
    fill_in 'user[name]', with: 'specuser01'
    fill_in 'user[email]', with: 'specuser01@gmail.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on '登録する'
    expect(page).to have_content 'specuser01'
  end
  scenario "specuser02以外のタスクが表示されていないことを確認する" do
    FactoryBot.create(:task)
    visit tasks_path
    fill_in 'session[email]', with: 'specuser03@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    expect(page).to_not have_content 'test02'
    click_on 'ログアウト'
    fill_in 'session[email]', with: 'specuser02@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    expect(page).to have_content 'test02'
  end

  scenario "specuser02以外のタスクが表示されていないことを確認する" do
    FactoryBot.create(:task)
    visit tasks_path
    fill_in 'session[email]', with: 'specuser03@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    expect(page).to_not have_content 'test02'
    click_on 'ログアウト'
    fill_in 'session[email]', with: 'specuser02@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    expect(page).to have_content 'test02'
  end

  scenario "他人のマイページに遷移しないことを確認する" do
    visit tasks_path
    fill_in 'session[email]', with: 'specuser03@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    visit user_path(2)
    expect(page).to_not have_content 'specuser02@gmail.com'
  end
  
  scenario "管理者権限のあるユーザが管理者画面を表示できること" do
    visit tasks_path
    fill_in 'session[email]', with: 'specuser03@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    visit admin_users_path
    expect(page).to have_content '管理画面:ユーザ 一覧'
  end

  scenario "管理者からユーザを削除できることを確認する。" do
    visit tasks_path
    fill_in 'session[email]', with: 'specuser03@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    visit admin_users_path
    expect(page).to have_content 'specuser02'
    click_link "削除",match: :first
    expect(page).to_not have_content 'specuser02'
  end
  
  scenario "管理者からユーザを削除できることを確認する。" do
    visit tasks_path
    fill_in 'session[email]', with: 'specuser03@gmail.com'
    fill_in 'session[password]', with: 'password'
    click_on 'ログイン'
    visit admin_users_path
    click_link "削除",match: :first
    click_link "削除",match: :first
    expect(page).to have_content '削除できません'
  end

  #save_and_open_page
end
