User.create!(first_name: "Dan Ray", last_name: "Rollan", mobile:"09560635541",email: "danrayrollan98@gmail.com", password: "password", password_confirmation: "password", role: User.roles[:admin])

User.create!(first_name: "Test", last_name: "Admin", mobile:"09560635541",email: "test@admin.com", password: "password", password_confirmation: "password", role: User.roles[:admin])

User.create!(first_name: "Test", last_name: "User", mobile:"09560635541",email: "test@user.com", password: "password", password_confirmation: "password")