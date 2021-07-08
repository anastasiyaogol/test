if Admin.count.zero?
	puts 'Seeding Admins'
	Admin.create!(email:'ogol.anastasiya@gmail.com',first_name:'Anastasiya',last_name:'Ogol',password:'123123',password_confirmation:'123123')
end