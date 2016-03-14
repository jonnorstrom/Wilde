require 'sinatra'
require 'mail'
require 'postmark'

get '/' do
  redirect '/index.html'
end

post '/send_claims_mail' do
#for the email recipient
  emailer = Postmark::ApiClient.new('a3410648-e7b1-4011-8827-183da0a3750d')
  textmailer = Postmark::ApiClient.new('a3410648-e7b1-4011-8827-183da0a3750d')
  emailer.deliver(
      from: "claims@wildecorpinsurance.com",
      to: "jon.norstrom@gmail.com",
      subject: "Claims Request from #{params["first_name"]}",
      text_body: "#{params["first_name"]} #{params["last_name"]} has requested a claim. They can be reached by phone at: #{params["phone_number"]} or by email at: #{params["email"]}. They're looking to file a claim under '#{params["personal_or_commercial"]}' insurance and left you this message:\n\n - #{params["brief_description"]}\n\n \n\n Thank you! Please get back to them soon."
  )
#for the text recipient
  textmailer.deliver(
      from: "claims@wildecorpinsurance.com",
      to: "3305925150@vtext.com",
      text_body: "#{params["first_name"]} #{params["last_name"]} has requested a claim. Phone: #{params["phone_number"]} Email: #{params["email"]}. They're looking to file a '#{params["personal_or_commercial"]}' claim."
  )

  redirect '/thank_you.html'
end






















post '/send_request_mail' do
  mailer = Postmark::ApiClient.new('a3410648-e7b1-4011-8827-183da0a3750d')
      checked_boxes = []
      params.each do |key, value|
      if value == "on"
        checked_boxes << key
      end

    end
  mailer.deliver(
      from: "quotes@wildecorpinsurance.com",
      to: ["jon.norstrom@gmail.com", "3307147018@vtext.com"],
      subject: "(blank) Insurance Quote Requested by #{params["first_name"]}",
      text_body: "#{params["first_name"]} #{params["last_name"]} has requested a quote for #{params["personal_or_commercial"]} insurance. They can be reached by phone at: #{params["phone_number"]} or by email at: '#{params["email"]}' They are interested in #{checked_boxes.join(", ")} insurance types. They left you this message:\n\n - #{params["comments"]}\n\n \n\n Thank you! Please get back to them soon."
  )

  redirect '/thank_you.html'
end
