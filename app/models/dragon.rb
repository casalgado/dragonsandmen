class Dragon < ActiveRecord::Base

  validates :name, presence: true
  has_many  :dragonmedals, :dependent => :destroy
  
  include Player

  def damage_increase
    10
  end


end
