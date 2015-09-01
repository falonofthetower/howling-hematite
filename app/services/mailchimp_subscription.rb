class MailchimpSubscription
  attr_reader :giver, :gibbon
  LIST_ID = ENV["MAILCHIMP_LIST_ID"]

  def self.subscribe(giver)
    if giver.subscribe?
      gibbon = Gibbon::Request.new
      gibbon.lists(LIST_ID).members.create(
        body: {email_address: giver.email, status: "subscribed", merge_fields: {NAME: giver.full_name}}
      )
    end
  end
end
