# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  receiver_id :integer          not null
#  chat_id     :integer          not null
#  date        :date
#  body        :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Order < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :receiver, class_name: "User"
  belongs_to :chat

  aasm column: "status" do
  	state :pending, initial: true
  	state :active
  	state :denied

  	event :accepted do
  		transitions from: [:pending], to: [:active]
  	end	

  	event :rejected do
  		transitions from: [:active, :pending], to: [:denied]
  	end
  end
end
