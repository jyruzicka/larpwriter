class ApplicationMailer < ActionMailer::Base
  default from: "florent@larpwriter.com"

  def new_organizer_invitation organizer: organizer, inviter: inviter
    @organizer, @inviter = organizer, inviter
    mail(
      to:             header_for(@organizer),
      subject:        "#{@inviter.name} invited you to participate in the larp #{@organizer.larp.name}!",
      "Message-ID" => random_message_id
    )
  end

  private

  # person can be a User or Organizer record
  def header_for person
    "#{person.name} <#{person.email}>"
  end

  # from http://blog.mailgun.net/post/tips-tricks-avoiding-gmail-spam-filtering-when-using-ruby-on-rails-action-mailer/#comment-867736623
  def random_message_id
    "<#{SecureRandom.uuid}@#{ENV['HOST']}>"
  end
end
