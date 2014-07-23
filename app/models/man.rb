class Man < ActiveRecord::Base

  validates :name, presence: true
  has_many  :manmedals, :dependent => :destroy


  include Player

  def damage_increase
    10
  end


end
