#todo remove the key info from this file and have env variable
#todo recreate new API keys when do that
if Rails.env == 'production'
  Rails.configuration.stripe = {
    :publishable_key => 

pk_test_51LGH08SEUWkeAJMoTfir7Nml9U7p0hQdmWrHUVbJcyMdBVoKnAX9jpHlCvZ6XVvAvYsJcJcgKA1xt2bqjzTV4VSP00v7gTjhBP,
    :secret_key      =>

sk_test_51LGH08SEUWkeAJMoOj7Jd8TyTaFBiICdUT4eU45vwEkobeHubl7VPM93x6vzS3qzMw3FbRjlRb5CB2hoAbh4T4No00m0Ppj2e7
  }

end

Stripe.api_key = Rails.configuration.stripe[:secret_key]