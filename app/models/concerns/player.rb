require 'active_support/concern'
require 'active_support/core_ext/numeric'


module Player
  extend ActiveSupport::Concern

  included do
  	belongs_to :user
  	validates  :user,   presence: true
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

  def atack(player)
       player.hit_points -= self.damage
    if player.dead?
       player.deaths     += 1
       player.hit_points  = 0
       self.kills    += 1
       player.save

       attacker = User.find(self.user_id)
       defender = User.find(player.user_id)
       attacker.user_money += player.level
       attacker.save
       defender.user_money -= player.level
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
         self.atack(player)
      else
         player.atack(self)
      end
    end
 
  end

  module ClassMethods
  end

end

      #(self.level).minutes.to_i)