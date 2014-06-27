CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET']
  }
  config.fog_directory  = ENV['S3_BUCKET']

  if Rails.env.test?
    CarrierWave.configure do |config|
      config.enable_processing = false
    end
  end
end