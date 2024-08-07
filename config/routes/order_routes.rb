namespace :orders do
  post('/', controller: '/order', action: :create)
  patch('/success', controller: '/order', action: :success)
end
