class DragonsController < ApplicationController

  

  def new
  end

  def edit
  end

  def show
  	@dragon = Dragon.find(params[:id])
  end

  def index
  	@dragons = current_user.dragons
  end


  def fight
    @dragon = Dragon.find(params[:id])
    @man    = Man.find(params[:guy])
    @dragon.fight(@man)
    redirect_to men_path if @dragon.dead?
    redirect_to dragons_path if @man.dead?
  end

  def choose
    @dragon = Dragon.find(params[:id])
    @men    = Man.all
  end

  def create
  	@dragon = current_user.dragons.new(dragon_params)
    if @dragon.save
  	redirect_to dragons_path
    else
    redirect_to new_dragon_path
    end
  end

  def practice
  	@dragon = Dragon.find(params[:id])
  	@dragon.lvlup
  	@dragon.save
  	redirect_to dragons_path
  end

  private

  def dragon_params
  	allow = [:name]
  	params.require(:dragon).permit(allow)
  end

end

# render :text => params.inspect