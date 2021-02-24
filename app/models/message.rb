class Message < ApplicationRecord
  belongs_to :rooms
  belongs_to :user
end
