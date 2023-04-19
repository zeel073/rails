class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_new_user!

    def create
      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil

      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, Rails.application.credentials[:stripe][:development][:webhook_key]
        )
      rescue JSON::ParserError => e
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "Signature error"
        p e
        return
      end
      # Handle the event
      case event.type
      when 'checkout.session.completed'
        session = event.data.object
        product = Product.find_by(id: session.metadata.product_id)
        product.update(is_paid: true)
        flash[:alert] = "Product purchased successfully!"
      end

      render json: { message: 'success' }
    end
end
