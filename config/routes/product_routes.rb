namespace :products do
  get('/', controller: '/product', action: :index)
  get('/:id', controller: '/product', action: :show)
end
