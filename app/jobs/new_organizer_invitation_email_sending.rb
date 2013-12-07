class NewOrganizerInvitationEmailSending
  include SuckerPunch::Job

  def perform organizer: organizer, inviter: inviter
    ActiveRecord::Base.connection_pool.with_connection do
      ApplicationMailer.new_organizer_invitation(organizer: organizer, inviter: inviter).deliver
    end
  end
end
