class OtpVerify < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
