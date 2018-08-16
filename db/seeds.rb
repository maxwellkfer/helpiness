Booking.destroy_all
Service.destroy_all
User.destroy_all
Category.destroy_all
University.destroy_all

NAMES = ["Augusto Menezes", "Antelmo Bandeira", "Dinis Roque", "Vicente Pascoal",

 "Feliciano Resende", "Victorino Gusmão", "Xavier Rodrigues", "Jacó Álvares",

 "Carmo Azevedo", "Otávio Barbosa", "Alexandra Nogueira", "Érica Valente",

 "Brígida Fidalgo", "Paulinha Leitão", "Leonor Leite", "Luzia Soares",

 "Iara Cortes", "Soraia Furtado", "Vera Fernandes", "Bruna Pacheco", "Vi Gose",

 "Teddy Boshart", "Krista Herriman", "Mardell Dove", "Mildred Flippo",

 "Wilbert Orourke", "Mohammad Morales", "Malorie Klapper", "Jeniffer Obrian", "Judy Dejean"]
DESCRIPTION = [""]

["Tutoring", "Activity Partners", "Rideboard & Carpools", "Manual Labor"].each do |category|
  Category.create({name: category})
end

uni = University.create name: 'Durham'

20.times do

 user = User.new(
  first_name: NAMES.sample,
  email: Faker::Internet.email,
  password: "asdfgh",
  university_id: uni.id
  )

 user.save!

 5.times do
  Service.create(
    name: Faker::Job.field,
    description: "smsmmsm",
    helpies: rand(1...500),
    category: Category.all.sample,
    user: user
    )
 end

end



20.times do
 customer = User.new(
  first_name: NAMES.sample,
  email: Faker::Internet.email,
  password: "asdfgh",
  university_id: uni.id
 )

 customer.save

 20.times do
  Booking.create(
   service: Service.all.sample,
   customer: customer
  )
 end

end
