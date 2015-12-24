#seeds for users
p "Seeding Users..."
5.times do
     User.create(        
        fname: Faker::Name.first_name,
        lname: Faker::Name.last_name,
        email: Faker::Internet.email
      )     
end 
p "Users seeded"  

#seeds events for user_id = 1
p "---------------------------------------------------------"
p "Seeding Events for user_id = 1"
  Event.create(        
    name: "Eminem",
    image: "https://consequenceofsound.files.wordpress.com/2013/10/eminem.jpg",
    address: "Pinheiros, Sao Paulo",
    event_date: "2016-04-07",
    latitude: -23.5619862,
    longitude: 46.6971976,
    user_id: 1
  )
  Event.create(        
    name: "Florence",
    image: "http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2015/2/12/1423759757798/6a8c828c-41ef-43aa-bb73-75d86aee1c00-2060x1236.jpeg",
    address: "Osasco, Sao Paulo",
    event_date: "2016-03-12",
    latitude: -23.5328838,
    longitude: -46.8545641,
    user_id: 1
  )
p "Events seeded"  