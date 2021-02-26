module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on ('Log in')
    expect(current_path).to eq(root_path)
  end
end