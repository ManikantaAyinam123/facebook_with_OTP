class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         has_many :post
         has_many :comment

         has_one :otp_verify
         validates :user_name, presence: true, uniqueness: true
         validates :Phone_number, presence: true, length: { minimum: 10, maximum: 15 }
          validates :gender, inclusion: { in: %w(male female other), message: "must be male, female, or other" }
          
         
          def self.ransackable_attributes(auth_object = nil)
            ["Phone_number", "created_at", "email", "encrypted_password", "gender", "id", "id_value", "phone_number_verified", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "user_name"]
          end
          
  
end
