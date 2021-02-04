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
#  type_service           :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :career
  has_many :progresses
  has_many :job_applications
  has_many :chats
  has_many :messages
  has_many :orders
  has_many :homeworks
  has_many :extensions
  has_many :homework_reviews

  has_one_attached :photo

  def self.total
    suma = 0
    usuarios = User.where(rol:"professional").or(User.where(rol:"editor"))

    usuarios.each do |usuario|
      suma += usuario.mount
    end
    suma
  end
  
end
