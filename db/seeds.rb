Booking.destroy_all
Service.destroy_all
Category.destroy_all

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



 user = User.new(
  first_name: NAMES.sample,
  email: Faker::Internet.email,
  password: "asdfgh",
  university_id: University.create(name: "Stanford"),
  helpies: 100,
  field: 'Math',
  hobby: "Guitar"
  )

# 20.times do


#  user = User.new(
#   first_name: NAMES.sample,
#   email: Faker::Internet.email,
#   password: "asdfgh",
#   university_id: uni.id,
#   helpies: 100
#   )

#  user.save!

50.times do
  Service.create!(
    name: Faker::Job.field,
    description: "As a yoga student yourself, you are well aware that everyone spaces out in class once in a while. Truthfully, whose eyes don't glaze over after 90 minutes of impersonal and generalized instructions? Make your teaching more skillful and intimate by using your students' names. Instead of repeating the same tired instructions, really look at your students, and help them clarify, expand, or deepen their poses by relating to them directly.",
    helpies: rand(20...200),
    category: Category.find_by_name('Tutoring'),
    remote_photo_url: "https://source.unsplash.com/random",
    user: User.find_by_first_name('bob')
    )
  puts Service.last.photo
 end


# 20.times do
#  customer = User.new(
#   first_name: NAMES.sample,
#   email: Faker::Internet.email,
#   password: "asdfgh",
#   university_id: uni.id,
#   helpies: 100
#  )

#  customer.save


20.times do
 customer = User.new(
  first_name: NAMES.sample,
  email: Faker::Internet.email,
  password: "asdfgh",
  university_id: University.create(name: "Stanford"),
  helpies: 100,
  field: "Math",
  hobby: "Guitar"
 )
 
#  20.times do
#   Booking.create(
#    service: Service.all.sample,
#    customer: customer
#   )
#  end



["Tutoring", "Activity Partners", "Rideboard & Carpools", "Manual Labor"].each do |category|
  Category.create({name: category})

end


