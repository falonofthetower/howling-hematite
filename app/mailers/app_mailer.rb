class AppMailer < ActionMailer::Base
  default from: "info@howling-hematite.herokuapp.com/"

  def send_account_token(user)
    @user = user
    mail to: user.email, subject: "Access your donations records"
  end
end
