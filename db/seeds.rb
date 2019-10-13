name = 'testuser01'
email = 'testuser01@gmail.com'
password = 'password'
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             )
