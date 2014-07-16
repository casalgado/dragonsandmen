class Dragon < ActiveRecord::Base

	def lvlup
		self.hp  += 100
		self.atk += 10
	end

	def dead?
    self.hp <= 0
  end

  def atak(man)
  	man.hp -= self.atk
  	man.save
  end

  def fight(man)
    ary = [1,2]
    until self.dead? || man.dead?
      if ary[rand(2)].even?
        self.atak(man)
      else
        man.atak(self)
      end
    end
      if man.dead?
        self.kills += 1
        man.deaths += 1
        man.hp      = 0
      elsif self.dead?
        man.kills += 1
        self.hp    = 0
      end

    self.save
    man.save
 
  end

end
