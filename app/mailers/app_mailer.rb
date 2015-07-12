class AppMailer < ActionMailer::Base
  default from: "info@howling-hematite.herokuapp.com/"

  def send_account_token(giver)
    @giver = giver
    mail to: giver.email, subject: "Access your donations records"
  end
end
