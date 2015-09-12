class MailchimpSubscription
  attr_reader :giver, :gibbon
  LIST_ID = ENV["MAILCHIMP_LIST_ID"]

  def self.subscribe(giver)
    if giver.subscribe?
      gibbon = Gibbon::Request.new
      gibbon.lists(LIST_ID).members.create(
        body: {email_address: giver.email, status: "subscribed", merge_fields: {FNAME: giver.first_name, LNAME: giver.last_name}}
      )
    end
  end
end
