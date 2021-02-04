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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
