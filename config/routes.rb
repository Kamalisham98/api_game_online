Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  draw('/product_routes')
  draw('/payment_routes')
  draw('/order_routes')
end
