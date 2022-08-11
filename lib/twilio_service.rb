require 'dotenv/load'
require "twilio-ruby"

class TwilioService
  def initialize
    @account_sid = ENV["ACCOUNT_SID"]
    @auth_token = ENV["AUTH_TOKEN"]
    @from_number = ENV["FROM_NUMBER"]
    @client = Twilio::REST::Client.new(@account_sid,@auth_token)
  end

  def send_text(message,to_number)
    message = @client.messages.create(
    body: message, 
    from: @from_number, 
    to: to_number)
    return message.status
  end
end