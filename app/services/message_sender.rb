class MessageSender
  def self.send_messages
    new.send_messages
  end

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @phone_numbers = User.all.map(&:phone_number)
  end

  def send_messages
    @phone_numbers.each do |ph|
      @client.messages.create(:from => twilio_number, :to => ph , :body => "Please attend this blood drive event and help save a life."
 
    end
  end



  private

  def twilio_number
    twilio_number = '+17864012751 '
  end
end
