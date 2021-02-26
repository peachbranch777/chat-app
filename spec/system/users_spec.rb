require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに遷移する' do
    visit root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    @user.save
    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on ('Log in')
    expect(current_path).to eq(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    @user.save
    visit root_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'Email', with: 'test'
    fill_in 'Password', with: 'aaaaaa'
    click_on('Log in')
    expect(current_path).to eq(new_user_session_path)
  end

  
end
