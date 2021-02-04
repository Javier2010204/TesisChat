# == Schema Information
#
# Table name: extensions
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  chat_id     :integer          not null
#  receiver_id :integer          not null
#  status      :string
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ExtensionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
