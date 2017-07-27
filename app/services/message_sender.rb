class MessageSender
# MessageSender.send_messages
  def self.send_messages
    new.send_messages
  end

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @phones = Donor.all.map(&:phone)
  end

  def send_messages
    @phones.each do |ph|
      @client.messages.create(:from => twilio_number, :to => ph , :body => "Please attend this blood drive event and help save lives.")
    end
  end



  private

  def twilio_number
    twilio_number = '+1954280955'
  end
end
