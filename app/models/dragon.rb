class Dragon < ActiveRecord::Base

  validates :name, presence: true
  
  include Player

  def hit_point_increase
    10
  end


end
