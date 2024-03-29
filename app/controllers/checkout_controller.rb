class CheckoutController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @product_name = Product.find(params[:product_id]).product_name
    @product_price = Product.find(params[:product_id]).product_price
    @session = Stripe::Checkout::Session.create(
      line_items: [{
                     price_data: {
                       currency: 'inr',
                       unit_amount: @product_price*100,
                       product_data: {
                         name: @product_name,
                         images: [url_for(@product.product_image)]
                       },
                     },
                     quantity: 1,
                   }],
      mode: 'payment',
      metadata: {
        product_id: @product.id,
        # account_id: current_account.id
      },
      allow_promotion_codes: true,
      success_url: products_url,
      cancel_url: product_url(id: @product.id),
    )
    # Stripe::Coupon.create({percent_off: 20, duration: 'once'})
    respond_to do |format|
      format.js
    end

  end
end
