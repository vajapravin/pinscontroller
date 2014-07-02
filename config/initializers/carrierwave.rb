CarrierWave.configure do |config|
  config.dropbox_app_key = ENV["PINSCONTROLLER_DROPBOX_APP_KEY"]
  config.dropbox_app_secret = ENV["PINSCONTROLLER_DROPBOX_APP_SECRET"]
  config.dropbox_access_token = ENV["PINSCONTROLLER_DROPBOX_ACCESS_TOKEN"]
  config.dropbox_access_token_secret = ENV["PINSCONTROLLER_DROPBOX_ACCESS_TOKEN_SECRET"]
  config.dropbox_user_id = ENV["PINSCONTROLLER_DROPBOX_USER_ID"]
  config.dropbox_access_type = "dropbox"
end