# == Schema Information
#
# Table name: progresses
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Progress < ApplicationRecord
  belongs_to :user
  has_many_attached :documents
  attr_accessor :my_documents
end
