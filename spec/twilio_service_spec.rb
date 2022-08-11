require "twilio_service"
require 'dotenv/load'

RSpec.describe TwilioService do
 context "sending an sms" do
  xit "returns a successful alert" do
   twilio = TwilioService.new
   expect(twilio.send_text(ENV["MESSAGE"], ENV["TO_NUMBER"])).to eq "queued"
  end
 end
end