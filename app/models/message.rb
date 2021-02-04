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
#  status     :string
#
class Message < ApplicationRecord
  include AASM
  belongs_to :chat
  belongs_to :user

  has_many_attached :documents

  aasm column: "status" do
  	state :send, initial: true
  	state :active
  	state :denied

  	event :accepted do
  		transitions from: [:send], to: [:active]
  	end	

  	event :rejected do
  		transitions from: [:active, :send], to: [:denied]
  	end
  end

end
