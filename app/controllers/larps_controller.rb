class LarpsController < ApplicationController
  layout "application",           only: [:new, :create]

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
      redirect_to @larp, notice: "Your larp has been created!"
    else
      render :new
    end
  end

  def show
    @larp = Larp.find params[:id]
    @relationships_without_reverse_count = @larp.relationships.without_reverse.count
  end

  def edit
  end

  def update
    if @larp.update larp_params
      redirect_to larp_path(@larp), notice: "Larp successfully edited"
    else
      render :new
    end
  end

  def missing_relationships
    @relationships_without_reverse = @larp.relationships.without_reverse
  end

  private

  def get_larp
    @larp = Larp.find params[:id]
  end

  def larp_params
    params[:larp].permit!
  end
end
