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
require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
