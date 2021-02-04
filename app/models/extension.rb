# == Schema Information
#
# Table name: extensions
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  chat_id     :integer          not null
#  receiver_id :integer          not null
#  status      :string
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Extension < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :chat
  belongs_to :receiver, class_name: "User"


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
