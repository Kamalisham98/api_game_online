namespace :payments do
  get('/', controller: '/payment', action: :index)
  get('/:id', controller: '/payment', action: :show)
end
