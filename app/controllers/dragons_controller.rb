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
#     @dragon.fight(@man)

  end

  def choose
    @dragon = Dragon.find(params[:id])
    @men    = Man.all
  end

  def create
  	@dragon = current_user.dragons.new(dragon_params)
    if current_user.user_money >= 10
      if @dragon.save
      current_user.create_dragon_cost

    	redirect_to dragons_path
      else
      flash[:notice] = "Invalid Params"
      redirect_to new_dragon_path
      end
    else
      flash[:notice] = "Not enough Money"
      redirect_to :back
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

  def engage
    @dragon = Dragon.find(params[:id])
    @man    = Man.find(params[:guy])
    @dragon.fight(@man)
     if @dragon.dead?
     flash[:notice] = "#{@man.name} ha vencido!"
     elsif @man.dead?
     flash[:notice] = "#{@dragon.name} ha vencido!"
     end
     redirect_to :back

  end


  private

  def dragon_params
  	allow = [:name]
  	params.require(:dragon).permit(allow)
  end

end

# render :text => params.inspect