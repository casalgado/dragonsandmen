class Dragonmedal < ActiveRecord::Base

		include Medal

  	belongs_to :dragon

  	def give_medal(dragon)

  		if dragon.kills >= 1
	      self.type_of_medal = "Bronze"
	    end
	    if dragon.kills >= 5
	      self.type_of_medal = "Silver"
	    end
	    if dragon.kills >= 10
	      self.type_of_medal = "Gold"
	    end


		end
	
end
