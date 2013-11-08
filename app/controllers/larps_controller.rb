class LarpsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_larp,        except: [:new, :create]
  before_action :authorize_user!, except: [:new, :create]

  def new
    @larp = Larp.new
  end

  def create
    @larp = Larp.new larp_params
    # FIXME better use a service object?
    if @larp.save
      @larp.organizers.create! first_name: current_user.email[/[^@]+/], user: current_user, email: current_user.email
      redirect_to @larp, success: "Your larp has been created!"
    else
      render :new
    end
  end

  def show
    @larp = Larp.find params[:id]
  end

  private

  def authorize_user!
    unless current_user.site_admin? || current_user.is_organizer_of?(@larp)
      redirect_to root_path, alert: "You are not authorized to access this page"
      false
    end
  end

  def get_larp
    @larp = Larp.find params[:id]
  end

  def larp_params
    params[:larp].permit!
  end
end
