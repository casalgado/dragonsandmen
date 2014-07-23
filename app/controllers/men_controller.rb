class MenController < ApplicationController

  before_action :authenticate_user!, except: [:create]  

  def new
  end

  def edit
    @man = Man.find(params[:id])
  end

  def my_men
    @men = current_user.men
  end

  def index
    @men = Man.where.not(user_id: current_user.id)
  end

  def practice
    @man = Man.find(params[:id])
      if @man.active?
      @man.lvlup
      flash[:notice] = "Level Up!"
      else
      flash[:notice] = "Not allowed to train yet"
      end
      redirect_to my_men_user_men_path
  end

  def create
  	@man = current_user.men.new(man_params)
    if @man.save
    redirect_to my_men_user_men_path
    else
    redirect_to new_man_path
    end
  end



  private

  def man_params
  	allow = [:name]
  	params.require(:man).permit(allow)
  end


end
