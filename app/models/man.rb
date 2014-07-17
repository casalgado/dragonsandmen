class Man < ActiveRecord::Base

	def lvlup
		self.hp  += 100
		self.atk += 10
	end

	def dead?
    self.hp <= 0
  end


  def atacked_by(dragon)
    self.hp -= dragon.atk
    if self.dead?
      self.deaths  += 1
      self.hp       = 0
      dragon.kills += 1
      dragon.save
    end
      
    self.save
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
