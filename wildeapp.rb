require 'sinatra'
require 'mail'
require 'postmark'

get '/' do
  redirect '/index.html'
end

get '/send_mail' do
  mailer = Postmark::ApiClient.new('a3410648-e7b1-4011-8827-183da0a3750d')
  mailer.deliver(from: 'claims@wildecorpinsurance.com', to: 'michael@docondev.com', subject: 'A Test Email', text_body: 'A simple plain text test email.')
  redirect '/thank_you.html'
end
