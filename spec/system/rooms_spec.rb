require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    sign_in(@room_user.user)
    click_on(@room_user.room.name)
    FactoryBot.create_list(:message, 5, room_id: @room_user.room.id, user_id: @room_user.user.id)
    expect {
      click_on('チャットを終了する')
    }.to change {Room.count}.by(-5)
    expect(current_path).to eq(root_path)
  end

end
