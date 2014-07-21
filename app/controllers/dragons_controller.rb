class DragonsController < ApplicationController

  before_action :authenticate_user!, except: [:create]  

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
    if @dragon.dead?
    flash[:notice] = "#{@man.name} ha vencido!"
    redirect_to men_path   
    elsif @man.dead?
    flash[:notice] = "#{@dragon.name} ha vencido!"
    redirect_to dragons_path
    end
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
      if @dragon.active?
      @dragon.lvlup
      flash[:notice] = "Level Up!"
      else
      flash[:notice] = "Not allowed to train yet"
      end
      redirect_to dragons_path
  end

  private

  def dragon_params
  	allow = [:name]
  	params.require(:dragon).permit(allow)
  end

end

# render :text => params.inspect