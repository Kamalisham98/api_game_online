Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'mallsgame.com' if Rails.env.production?
    origins 'localhost:3001',
            '127.0.0.1:3001'

    resource '*', headers: :any,
                  methods: %i[get post put patch delete options head],
                  credentials: true,
                  max_age: 86_400
  end
end
