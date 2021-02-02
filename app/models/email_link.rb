class EmailLink < ApplicationRecord
  belongs_to :user

  def self.generate(email)
    user = User.find_by(email: email)

    return nil if !user

    create(user: user, expires_at: Date.today + 1.day, token: generate_token)
  end


  def self.generate_token
    Devise.friendly_token.first(16)
  end
  
  
end
