Rails.configuration.stripe = {
  :publishable_key => "pk_test_wKEoF8llDeZgzuRmEyVeDlg2",
  :secret_key      => "sk_test_5FtPcLeGSZXfEIWUWgjtJHfk"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
