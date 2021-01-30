class Extension < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  belongs_to :receiver
end
