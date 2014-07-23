class DragonmedalsController < ApplicationController
  def new
  end

  def create
  	@dragon = Dragon.find(params[:id])
  	@medal  = @dragon.dragonmedals.new
    @medal.give_medal(@dragon)
    if @medal.save
       flash[:notice] = "Has obtenido una medalla!"
    end
    redirect_to :back
  end

  def edit
  end

  def show
  end
end
