# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  receiver_id    :integer          not null
#  chat_id        :integer          not null
#  date           :date
#  body           :text
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  number_page    :integer
#  extension_date :date
#
class Order < ApplicationRecord
	after_create :send_mail
  include AASM

  belongs_to :user
  belongs_to :receiver, class_name: "User"
  belongs_to :chat
  has_many :extension_orders

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

  def send_mail
	  OrderMailer.created_order(self).deliver_now
  end

  def update_order_date(date)
	  self.update(date: date)
  end
  
  
end
