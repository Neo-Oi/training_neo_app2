User.destroy_all

User.create!(
  name: "admin",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: "admin"
)

User.create!(
  name: "abc",
  email: "abc@example.com",
  password: "password",
  password_confirmation: "password",
  role: "member"
)
