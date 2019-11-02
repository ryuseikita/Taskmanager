name = 'administrator'
email = 'administrator@gmail.com'
password = 'password'
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             admin: 'true'
             )
