class MessageSender
  def self.send_messages
    new.send_messages
  end

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def send_messages(event)
    begin
      scheme = request.scheme
      host = request.host
    rescue NameError
      scheme = 'http'
      host = 'testing'
    end
    message = <<EOL
Please attend this blood drive event and help save lives.
#{scheme}://#{host}
EOL
    Donor.where(zipcode: event.zipcode).map(&:phone).each do |ph|
      @client.messages.create(:from => twilio_number, :to => ph , :body =>message)
    end
  end

  private

  def twilio_number
    twilio_number = '+17864012751'
  end
end
