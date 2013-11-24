class OrganizersController < ApplicationController
  include IsAssetController

  def index
    @organizers = @larp.organizers.by_name
  end

  def new
    @organizer = @larp.organizers.build
  end

  def create
    @organizer = @larp.organizers.build organizer_params
    if @organizer.save
      ApplicationMailer.new_organizer_invitation(organizer: @organizer, inviter: current_user.as_organizer_in_larp(@larp)).deliver
      redirect_to larp_organizer_path(@larp, @organizer), notice: "Organizer successfully added! We've just sent him/her an invitation email."
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

  def get_asset
    @organizer = @larp.organizers.find params[:id]
  end

  def organizer_params
    params[:organizer].permit(:first_name, :last_name, :tags_string, :email, :phone_numbers)
  end
end
