class LarpsController < ApplicationController
  before_action :authenticate_user!

  def new
    @larp = Larp.new
  end

  def create
    @larp = Larp.new larp_params
    if @larp.save
      redirect_to @larp, success: "Your larp has been created!"
    else
      render :new
    end
  end

  def show
    @larp = Larp.find params[:id]
  end

  private

  def larp_params
    params[:larp].permit!
  end
end
