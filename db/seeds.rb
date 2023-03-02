danray = User.create!(first_name: "Dan Ray", last_name: "Rollan", mobile:"09560635541",email: "danray@admin.com", password: "password", password_confirmation: "password", role: User.roles[:admin])

User.create!(first_name: "Admin", last_name: "User", mobile:"09560635541",email: "admin@admin.com", password: "password", password_confirmation: "password", role: User.roles[:admin])

User.create!(first_name: "John", last_name: "Doe", mobile:"09560635542",email: "test1@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Jane", last_name: "Doe", mobile:"09560635543",email: "test2@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Yard", last_name: "Hansson", mobile:"09560635544",email: "test3@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Carol", last_name: "Danvers", mobile:"09560635545",email: "test4@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Tony", last_name: "Stark", mobile:"09560635546",email: "test5@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Barry", last_name: "Allen", mobile:"09560635547",email: "test6@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Oliver", last_name: "Queen", mobile:"09560635548",email: "test7@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Sarah", last_name: "Lance", mobile:"09560635549",email: "test8@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Stan", last_name: "Lee", mobile:"09560635550",email: "test9@user.com", password: "password", password_confirmation: "password")

User.create!(first_name: "Kara", last_name: "Danvers", mobile:"09560635551",email: "test10@user.com", password: "password", password_confirmation: "password")

Movie.create!(title: "Iron Man", user_id: User.first.id )
Movie.create!(title: "Iron Man 2", user_id: User.first.id )
Movie.create!(title: "Iron Man 3", user_id: User.first.id )
Movie.create!(title: "Thor", user_id: User.first.id )
Movie.create!(title: "Captain America: The First Avenger", user_id: User.first.id )
Movie.create!(title: "Captain Marvel", user_id: User.first.id )
Movie.create!(title: "Avengers: Civil War", user_id: User.first.id )
Movie.create!(title: "Doctor Strange", user_id: User.first.id )
Movie.create!(title: "Avengers: Infinity War", user_id: User.first.id )
Movie.create!(title: "Avengers: End Game", user_id: User.first.id )
Movie.create!(title: "Spider Man: Far From Home", user_id: User.first.id )
Movie.create!(title: "The Flash", user_id: User.first.id )
Movie.create!(title: "Green Arrow", user_id: User.first.id )
Movie.create!(title: "Supergirl", user_id: User.first.id )
Movie.create!(title: "Legends of Tomorrow", user_id: User.first.id )