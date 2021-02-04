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
  include AASM
  belongs_to :user
  belongs_to :professional, class_name: "User"
  has_many :messages
  has_many :orders
  has_many :homeworks
  has_many :extensions

  aasm column: "status" do
  	state :active, initial: true
    state :denied
    state :report
    
  	event :rejected do
  		transitions from: [:active, :report], to: [:denied]
    end
    
    event :reported do
      transitions from: [:active], to: [:report]
    end
  end
end
