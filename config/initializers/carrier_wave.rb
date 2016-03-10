if Rails.env.production?
 CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                       
    config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     ENV['S3_ACCESS_KEY'],   AKIAIJPVMKBFYITQW45A                     
    aws_secret_access_key: ENV['S3_SECRET_KEY']    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
  }
  config.fog_directory  = ENV['S3_BUCKET']
  config.fog_public     = false                         
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
end