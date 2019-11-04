name = 'administrator'
email = 'administrator@example.com'
password = 'password'
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             admin: 'true'
             )
