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
require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end