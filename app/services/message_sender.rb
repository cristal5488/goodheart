class MessageSender

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end
  # redirect default value false
  # when ready for prodcution, remove from method calling
  def send_messages(event, redirect: false)
    return if redirect #if redirect is true return(break)

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
