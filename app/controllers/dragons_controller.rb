class DragonsController < ApplicationController

  before_filter
  

  def new
  end

  def edit
  end

  def show
  	@dragon = Dragon.find(params[:id])
  end

  def index
  	@dragons = Dragon.all
  end

  def fight
    @dragon = Dragon.find(params[:id])
    @man    = Man.find(params[:guy])
    @dragon.fight(@man)
 

  end

  def choose
    @dragon = Dragon.find(params[:id])
    @men    = Man.all
  end

  def create
  	@dragon = Dragon.new(dragon_params)
  	@dragon.hp  = 100
  	@dragon.atk = 10
    @dragon.kills = 0
    @dragon.deaths = 0
  	@dragon.save
  	redirect_to dragons_path
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