name = 'administrator'
email = 'administrator@example.com'
password = 'password'
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             admin: 'true'
)
Label.create(
    name: 'test01'
)
Label.create(
    name:'test02'
)
Label.create(
    name:'test03'
)