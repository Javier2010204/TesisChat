# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  chat_id    :integer          not null
#  user_id    :integer          not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
end
