# == Schema Information
#
# Table name: chats
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  professional_id :integer          not null
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :professional, class_name: "User"
  has_many :messages
  has_many :orders
end
