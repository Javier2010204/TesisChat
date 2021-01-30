# == Schema Information
#
# Table name: homeworks
#
#  id          :integer          not null, primary key
#  chat_id     :integer          not null
#  user_id     :integer          not null
#  receiver_id :integer          not null
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Homework < ApplicationRecord
  include AASM
  belongs_to :chat
  belongs_to :user
  belongs_to :receiver, class_name: "User"

  has_many_attached :documents
  attr_accessor :my_documents


  aasm column: "status" do
  	state :pending, initial: true
  	state :active
  	state :denied

  	event :accepted do
  		transitions from: [:pending], to: [:active]
  	end	

  	event :rejected do
  		transitions from: [:pending], to: [:denied]
  	end
  end
end
