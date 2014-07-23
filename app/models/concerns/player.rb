require 'active_support/concern'
require 'active_support/core_ext/numeric'
require 'debugger'

module Player
  extend ActiveSupport::Concern

  included do
  	belongs_to :user
  	validates  :user, presence: true
    # scope :disabled, -> { where(disabled: true) }
  end

  def active?
    time_until_active <= 0
  end

  def time_until_active
    @time_until_active = (self.time_of_death.to_i + (self.level).minutes.to_i) - Time.now.to_i
    @time_until_active
  end

  def lvlup
    if self.active?
    self.hit_points   += 100
    self.damage       += self.damage_increase
    self.level        += 1
    self.time_of_death = Time.now 
    self.save
    end
  end

  def atacked_by(player)
       self.hit_points -= player.damage
    if self.dead?
       self.deaths     += 1
       self.hit_points  = 0
       player.kills    += 1
       player.save
       defender = User.find(self.user_id)
       attacker = User.find(player.user_id)
       attacker.user_money += self.level
       attacker.save
       defender.user_money -= self.level
       defender.save
    end
    self.save
  end

  def dead?
    self.hit_points <= 0
  end

  def fight(player)
    ary = [1,2]
    until self.dead? || player.dead?
      if ary[rand(2)].even?
         self.atacked_by(player)
      else
         player.atacked_by(self)
      end
    end
 
  end

  module ClassMethods
  end

end

      #(self.level).minutes.to_i)