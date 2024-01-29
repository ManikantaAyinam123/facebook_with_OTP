class CreateOtpVerifies < ActiveRecord::Migration[7.1]
  def change
    create_table :otp_verifies do |t|
      t.string :otp
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
