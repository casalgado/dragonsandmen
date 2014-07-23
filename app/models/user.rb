class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dragons, :dependent => :destroy
  has_many :men, :dependent => :destroy

  def create_dragon_cost
  	self.user_money -= 10
  	self.save
  end

  def fight_money_adjustment
  	if @dragon.dead?
  		self.user_money -= @man.level
  	end
  	if @man.dead?
  		self.user_money += @man.level
  	end
  	self.save
  end
         
end
