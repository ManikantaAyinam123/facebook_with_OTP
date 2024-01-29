class OtpVerifysController < ApplicationController
  def index
  end
  def new
    binding.pry
  end

  def create
    twilio_client = TwilioClient.new
    random_number = twilio_client.rr
    otp_value= params[:otp]
    nd = otp_value.to_i
   
    if  nd === random_number
      OtpVerify.create(
        otp: nd,
       user_id: current_user.id,
      )
      user = current_user
      user.update(phone_number_verified: true)
     
        redirect_to posts_path, notice: 'Post was successfully created.'
     
    else
      redirect_to root_path, notice: 'Failed to save OTP verification.' 
    end
  end
  def show
    user = current_user
    if user
   
    TwilioClient.new.send_text(user)
    redirect_to root_path, notice: 'Otp sent ' 
    else 
      redirect_to root_path, notice: 'Failed to save OTP verification.' 
    end
 
  end


  private

  def otp_verify_params
    params.require(:otp_verify).permit(:otp, :other_attribute, :another_attribute)
  end
end
