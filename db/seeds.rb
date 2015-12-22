#seeds for users
5.times do
     User.create(        
        fname: Faker::Name.first_name,
        lname: Faker::Name.last_name,
        email: Faker::Internet.email
      ) 
end 