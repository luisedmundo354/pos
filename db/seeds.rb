# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#5.times do |product|
#  Product.create!(
#    name: "Product #{product}",
#    unit: "kg",
#    stock: "3",
#    ss: "1",
#    deliver_time: "2",
#    supplier: "Mayumi",
#    phone: 99890233,
#    address: "Calle Real 1092",
#    level: "Suficiente",
#    commentary: "Atiende los miercoles"
#  )
#end

  SaleOrder.create!(
    number: 1,
    comment: "-",
    customer_id: 1,
  )

  PurchaseOrder.create!(
    number: 1,
    comment: "-",
    replenisher_id: 1,
  )
