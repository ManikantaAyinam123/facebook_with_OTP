ActiveAdmin.register User do
  # ... other configurations ...

  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :phone_number, :gender, :phone_number_verified, :otp_verify
  #
  filter :user_name
  filter :email
  filter :phone_number_verified, as: :boolean, label: 'Phone Number Verified'
 
  form do |f|
    f.inputs 'User Details' do
      f.input :user_name
      f.input :email
      f.input :gender 
      f.input :phone_number  # Corrected attribute name
      f.input :password
      f.input :password_confirmation
      f.input :phone_number_verified
    end
    f.actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :phone_number, :gender]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
