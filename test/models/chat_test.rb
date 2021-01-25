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
require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
