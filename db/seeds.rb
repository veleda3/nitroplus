# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



services = {
    'Free trial' => {'price' => 0},
    'Pay per month' => {'price' => 19.99},
    '6 months service' => {'price' => 90.00}
  }


  services.each do |service, info|
    Service.create(name: service, price: info['price'])
  end


equipments = {
  'Android s905' => {'price' => 50.00},
  'Android s912' => {'price' => 80.00}
}

equipments.each do |equipment, info|
  Equipment.create(name: equipment, price: info['price'])
end
