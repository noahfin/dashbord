class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.secrets.twilio_phone_number,
      to: '8452355502',
      body: message
    })
  end
end
