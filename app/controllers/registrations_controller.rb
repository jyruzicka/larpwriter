class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for user
    if user.organizers.any?
      user.organizers.order(:created_at).last.larp
    else
      root_path
    end
  end

end
