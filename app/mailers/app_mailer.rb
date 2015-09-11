class AppMailer < ActionMailer::Base
  default from: "noreply@fortrucksafety.com"

  def receipt(giver, donation)
    @giver = giver
    @donation = donation
    mail to: giver.email, subject: "Receipt for donation"
  end
end
