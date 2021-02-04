# == Schema Information
#
# Table name: email_links
#
#  id         :integer          not null, primary key
#  token      :string
#  expires_at :datetime
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class EmailLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
