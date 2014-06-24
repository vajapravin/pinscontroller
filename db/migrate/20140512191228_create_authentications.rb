class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.references :user, index: true
      t.string :provider
      t.string :auth_token
      t.datetime :expiry_time

      t.timestamps
    end
  end
end
