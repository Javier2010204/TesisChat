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
class EmailLink < ApplicationRecord
  belongs_to :user
  after_create :send_mail

  def self.generate(email)
    user = User.find_by(email: email)

    return nil if !user

    create(user: user, expires_at: DateTime.now + 12.hours, token: generate_token)
  end


  def self.generate_token
    Devise.friendly_token.first(16)
  end

  private
    def send_mail
      EmailLinkMailer.sign_in_mail(self).deliver_now
    end
    
  
  
end
