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
require 'test_helper'

class ExtensionOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
