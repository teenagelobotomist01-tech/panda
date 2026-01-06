# db/seeds.rb

# Usuario administrador
User.create!(
  name: "Admin",
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  admin: true
)

# Usuarios normales de prueba
User.create!(
  name: "Juan",
  email: "juan@example.com",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  name: "Maria",
  email: "maria@example.com",
  password: "password123",
  password_confirmation: "password123"
)

