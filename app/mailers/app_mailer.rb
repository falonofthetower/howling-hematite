class AppMailer < ActionMailer::Base
  default from: "info@howling-hematite.herokuapp.com/"

  def receipt(giver, donation)
    @giver = giver
    mail to: giver.email, subject: "Receipt for donation"
  end
end
