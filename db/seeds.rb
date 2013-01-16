puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :firstname => 'Firstname 1', :lastname => 'Lastname 1', :email => 'user11@example.com', :password => 'please123', :password_confirmation => 'please123', :confirmed_at => DateTime.now
puts 'New user created: ' << user.lastname
user2 = User.create! :firstname => 'Firstname 2', :lastname => 'Lastname 2', :email => 'user22@example.com', :password => 'please123', :password_confirmation => 'please123', :confirmed_at => DateTime.now
puts 'New user created: ' << user2.lastname
