class OrganizersController < ApplicationController
  layout "larps"

  before_action :authenticate_user!
  before_action :get_larp
  before_action :authorize_user!
  before_action :get_organizer, only: [:show, :edit, :update, :destroy]

  def index
    @organizers = @larp.organizers.by_name
  end

  def new
    @organizer = @larp.organizers.build
  end

  def create
    @organizer = @larp.organizers.build organizer_params
    if @organizer.save
      redirect_to larp_organizer_path(@larp, @organizer), notice: "Organizer successfully added!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @organizer.update organizer_params
      redirect_to larp_organizer_path(@larp, @organizer), notice: "Organizer successfully edited!"
    else
      render :edit
    end
  end

  def destroy
    @organizer.destroy!
    if @organizer.user == current_user
      redirect_to root_path, notice: "You are no longer organizer of the larp"
    else
      redirect_to larp_organizers_path(@larp), notice: "Organizer '#{@organizer.name}' successfully removed"
    end
  end

  private

  def get_larp
    @larp = Larp.find params[:larp_id]
  end

  def get_organizer
    @organizer = @larp.organizers.find params[:id]
  end

  def organizer_params
    params[:organizer].permit(:first_name, :last_name, :email, :phone_numbers)
  end
end
