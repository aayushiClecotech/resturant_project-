Role.create(name: :restaurant_owner)
Role.create(name: :normal_user)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?