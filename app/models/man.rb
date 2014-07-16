class Man < ActiveRecord::Base

	def lvlup
		self.hp  += 100
		self.atk += 10
	end

	def dead?
    self.hp <= 0
  end

  def atak(dragon)
  	dragon.hp -= self.atk
  	dragon.save
  end

  def fight(dragon)
  	ary = [1,2]
  	until self.dead? || dragon.dead?
  		if ary[rand(2)].even?
  			self.atak(dragon)
  		else
  			dragon.atak(self)
  		end
  		self.save
  		dragon.save
  	end
  end

end
