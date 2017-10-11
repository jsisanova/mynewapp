if Rails.env.production?
  Rails.configuration.stripe = {
    # publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    # secret_key: ENV['STRIPE_SECRET_KEY']     # env mode, not test mode
    publishable_key: 'pk_test_bhei1ECcFWGnkm7ZcDXT1Kuz',
    secret_key: 'sk_test_QnEc5CgPoyxev61QdYflN686'
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_bhei1ECcFWGnkm7ZcDXT1Kuz',
    secret_key: 'sk_test_QnEc5CgPoyxev61QdYflN686'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
