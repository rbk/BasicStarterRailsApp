# create_initial_user.rake

desc "Create inital admin user."
task :create_admin => :environment do
	Group.create(name: "admin")
	Group.create(name: "user")
	User.create( email: 'admin@localhost.com', password:"admin123", group: "admin" )	
	puts ""
	puts "Admin user created!"
	puts ""
	puts "Username: admin@localhost.com"
	puts "Password: admin123"
	puts ""
	puts "Please edit this users name and password!"
	puts ""
end