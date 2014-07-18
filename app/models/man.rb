class Man < ActiveRecord::Base

  validates :name, presence: true

  include Player

	def dead?
    self.hp <= 0
  end

  def hp_inc
    10
  end

  def atak(dragon)
  	dragon.hp -= self.atk
  	dragon.save
  end

  def fight(dragon)
  	ary = [1,2]
  	until self.dead? || dragon.dead?
  		if ary[rand(2)].even?
  			self.atacked_by(dragon)
  		else
  			dragon.atacked_by(self)
  		end
  	end
  end

end
