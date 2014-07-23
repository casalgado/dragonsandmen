class Dragon < ActiveRecord::Base

  validates :name, presence: true
  
  include Player

  def damage_increase
    10
  end


end
