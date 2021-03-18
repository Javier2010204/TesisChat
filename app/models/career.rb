# == Schema Information
#
# Table name: careers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Career < ApplicationRecord
    has_many :users

    def total
        users.sum(:mount)
    end
    
end
