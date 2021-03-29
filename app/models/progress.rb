# == Schema Information
#
# Table name: progresses
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Progress < ApplicationRecord
  after_create :get_job

  validates_presence_of :body

  belongs_to :user
  has_many_attached :documents
  attr_accessor :my_documents

  def get_job
    carrera = self.user.career_id
    profesionales = User.where(rol: "professional").where(career_id: carrera)
    random = User.where(rol: "professional").where(career_id: carrera).order(Arel.sql('RANDOM()')).first
    JobApplication.create(user:self.user,professional: random, stage:self.stage, expires_date: DateTime.now + 24.hours)
  end
  
  
end
=begin
  1- saber cual es la carrera del usuario
  2- buscar todos los profesionales que sean de la misma carrera
  3- asignar un profesional random de la lista anterior
  4- crear un JobApplication con los datos del usuario y el profesional
=end
