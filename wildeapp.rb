require 'sinatra'
require 'postmark'

configure do
  set :mailer, Postmark::ApiClient.new('')
end

get '/' do
  redirect '/index.html'
end

get '/send_mail' do
  settings.mailer.deliver(from: 'claims@wildecorpinsurance.com',
                          to: 'jon.norstrom@gmail.com',
                          subject: 'A Test Email',
                          text_body: 'A simple plain text test email.')
end
