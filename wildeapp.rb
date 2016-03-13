require 'sinatra'
require 'mail'
require 'postmark'

get '/' do
  redirect '/index.html'
end

post '/send_claims_mail' do

  mailer = Postmark::ApiClient.new('a3410648-e7b1-4011-8827-183da0a3750d')
  mailer.deliver(
      from: "claims@wildecorpinsurance.com",
      to: "michael@docondev.com",
      subject: "A Test Email",
      text_body: "#{params["first_name"]} #{params["last_name"]} has requested a claim.\n\nThis is new data."
  )

  # <input id="first_last" type="text" name="first_name" placeholder="First Name" />
  # <input id="first_last" type="text" name="last_name" placeholder="Last Name" />
  # <input id="phonenum" type="number" name="phone_number" placeholder="Phone: 555-555-5555" />
  # <input type="mail" name="email" placeholder="Email"/>
  # <select name="personal_or_commercial" id="select-choice">
  # textarea

  redirect '/thank_you.html'
end

post '/send_request_mail' do

  mailer = Postmark::ApiClient.new('a3410648-e7b1-4011-8827-183da0a3750d')
  mailer.deliver(
      from: "quotes@wildecorpinsurance.com",
      to: "michael@docondev.com",
      subject: "A Test Email",
      text_body: "#{params["first_name"]} #{params["last_name"]} has requested a claim.\n\nThis is new data."
  )

  redirect '/thank_you.html'
end
