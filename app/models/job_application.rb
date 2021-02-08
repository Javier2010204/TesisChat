# == Schema Information
#
# Table name: job_applications
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  professional_id :integer          not null
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class JobApplication < ApplicationRecord
	after_create :send_mail
  include AASM

  belongs_to :user
  belongs_to :professional, class_name: "User"

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
	  JobApplicationMailer.new_job_application_mail(self).deliver_now
  end
  
end
