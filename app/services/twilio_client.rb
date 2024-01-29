class TwilioClient
  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  
  end

  def send_text(user)
   
    $g = generate_random_number 
    @client.messages.create(
      from: phone_number,
      to: user.Phone_number, 
      body: $g
    )
   
  end
def rr
  $g
end
  

  private
  def generate_random_number
   
    @hj = rand(10000..99999)
 
end
  
  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

  def phone_number
    Rails.application.credentials.twilio[:phone_number]
  end
end
