class MenController < ApplicationController
  def new
  end

  def edit
  end

  def index
  	@men = Man.all
  end

  def practice
    @man = Man.find(params[:id])
    @man.lvlup
    @man.save
    redirect_to men_path
  end

  def create
  	@man = Man.new(man_params)
  	@man.hp  = 100
  	@man.atk = 10
    @man.kills = 0
    @man.deaths = 0
  	@man.save
  	redirect_to men_path
  end



  private

  def man_params
  	allow = [:name]
  	params.require(:man).permit(allow)
  end


end
