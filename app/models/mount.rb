class Mount < ApplicationRecord
  belongs_to :user


  def self.total
    suma = 0
    Mount.all.each do |mount|
      suma += mount.quantity
    end
    suma
  end
  
end
