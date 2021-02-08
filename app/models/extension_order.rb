# == Schema Information
#
# Table name: extension_orders
#
#  id             :integer          not null, primary key
#  extension_date :date
#  order_id       :integer          not null
#  user_id        :integer          not null
#  receiver_id    :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class ExtensionOrder < ApplicationRecord
	after_create :send_mail
  include AASM

  belongs_to :order
  belongs_to :user
  belongs_to :receiver, class_name: "User"

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

  def send_mail
	  ExtensionOrderMailer.created_extension_order(self).deliver_now
  end
  
end
