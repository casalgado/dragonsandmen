require 'active_support/concern'

module Player
  extend ActiveSupport::Concern

  included do
  	belongs_to :user
  	validates :user, presence: true
    # scope :disabled, -> { where(disabled: true) }
  end

  def lvlup
    self.hp  += 100
    self.atk += self.hp_inc
  end

  def atacked_by(player)
    self.hp -= player.atk
    if self.dead?
      self.deaths  += 1
      self.hp       = 0
      player.kills += 1
      player.save
    end
      
    self.save
  end
  
  module ClassMethods
    
  end
end