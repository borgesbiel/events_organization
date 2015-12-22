#seeds for users
p "Seeding Users..."
5.times do
     User.create(        
        fname: Faker::Name.first_name,
        lname: Faker::Name.last_name,
        email: Faker::Internet.email
      ) 
      p "#{Faker::Name.first_name} #{Faker::Name.last_name} #{Faker::Internet.email}"
end 