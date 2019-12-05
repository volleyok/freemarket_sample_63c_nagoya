Recaptcha.configure do |config|   
  config.site_key = 'RECAPTCHA_SITE_KEY'
  config.secret_key = 'RECAPTCHA_SECRET_KEY'  
  # config.skip_verify_env += %w[development]
end