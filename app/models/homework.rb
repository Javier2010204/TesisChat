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
	after_create :create_review
  	include AASM
  	belongs_to :chat
  	belongs_to :user
  	belongs_to :receiver, class_name: "User"
  	has_many :homework_reviews

  has_many_attached :documents
  attr_accessor :my_documents


  aasm column: "status" do
  	state :send, initial: true
  	state :active
	state :denied
	state :pending

  	event :accepted do
  		transitions from: [:pending], to: [:active]
	end

	event :validated do
		transitions from: [:send], to: [:pending]
	end
	  	

  	event :rejected do
  		transitions from: [:pending], to: [:denied]
  	end
  end

  def create_review
	carrera = self.user.career_id
    random = User.where(rol: "editor").where(career_id: carrera).order(Arel.sql('RANDOM()')).first
    HomeworkReview.create(editor: random, homework: self)
  end
  
end
