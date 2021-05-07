admin_account = User.new(
    email: "admin@mail.com",
    password: "123456",
    password_confirmation: "123456",
    admin: true
)

unless User.where("email = ?", admin_account.email).exists?
    admin_account.save!
end