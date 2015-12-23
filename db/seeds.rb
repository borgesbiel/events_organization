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
    name: "Coldplay",
    image: "https://lh5.googleusercontent.com/-FAnRo_TRYF0/AAAAAAAAAAI/AAAAAAAAZmU/WLmp1Hspye4/s0-c-k-no-ns/photo.jpg",
    address: "Allianz Parque, Sao Paulo",
    event_date: "2016-04-07",
    latitude: -23.5505199,
    longitude: -46.6333094,
    user_id: 1
  )
  Event.create(        
    name: "Lollapalooza",
    image: "http://lolp1.br.c3cdn.com/wp/wp-content/uploads/2013/12/novologololla2.png",
    address: "Autodromo de interlagos, Sao Paulo",
    event_date: "2016-03-12",
    latitude: -23.7062075,
    longitude: -46.6883859,
    user_id: 1
  )
p "Events seeded"  