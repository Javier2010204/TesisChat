# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  name                   :string
#  rol                    :string           default("student")
#  points                 :integer
#  career_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mount                  :decimal(, )      default(0.0)
#  service                :string
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
