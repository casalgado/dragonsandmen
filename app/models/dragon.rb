class Dragon < ActiveRecord::Base

	def lvlup
		self.hp  += 100
		self.atk += 10
	end

	def dead?
    self.hp <= 0
  end

  def atacked_by(man)
    self.hp -= man.atk
    if self.dead?
      self.deaths += 1
      self.hp      = 0
      man.kills   += 1
      man.save
    end
      self.save
  end


  def atak(man)
  	man.hp -= self.atk
  	man.save
  end

  def fight(man)
    ary = [1,2]
    until self.dead? || man.dead?
      if ary[rand(2)].even?
        self.atacked_by(man)
      else
        man.atacked_by(self)
      end
    end
 
  end

end
