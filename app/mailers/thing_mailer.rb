class ThingMailer < ActionMailer::Base
  default from: "info@ecologyottawa.ca"

  def reminder(thing)
    @thing = thing
    @user = thing.user
    mail(
      {
        to: thing.user.email,
        subject: ["Remember to care for", thing.name].compact.join(' '),
      }
    )
  end
end
