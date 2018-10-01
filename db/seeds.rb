require_relative("../models/item")
require_relative("../models/manufacturer")
require("pry-byebug")

manufacturer1 = Manufacturer.new ({
  "name" => "Shimano",
  "address" => "105 Ultegra Blv'd, Tokyo",
  "phone" => "111-27",
  # "item_id" => item1.id
})
manufacturer1.save()
manufacturer2 = Manufacturer.new ({
  "name" => "Chris King",
  "address" => "123 Steel Street, Oregon",
  "phone" => "13-356",
  # "item_id" => item2.id
})
manufacturer2.save()
manufacturer3 = Manufacturer.new ({
  "name" => "Continental",
  "address" => "33 Rubber Road, Koblenz",
  "phone" => "53-234",
  # "item_id" => item4.id
})
manufacturer3.save()
manufacturer4 = Manufacturer.new ({
  "name" => "Zipp",
  "address" => "303 Airblade Avenue, Indiana",
  "phone" => "111-2",
  # "item_id" => item3.id
})
manufacturer4.save()

item1 = Item.new({
  "manufacturer_id" => manufacturer1.id,
  "component" => "rim",
  "cost" => 150,
  "price" => 200,
  # "margin" => 3,
  "quantity" => 30,
  "low_stock" => 10,
  "critical_stock" => 6
})
item1.save()
item2 = Item.new({
  "manufacturer_id" => manufacturer2.id,
  "component" => "hub",
  "cost" => 105,
  "price" => 150,
  # "margin" => 3,
  "quantity" => 15,
  "low_stock" => 5,
  "critical_stock" => 2
})
item2.save()
item3 = Item.new({
  "manufacturer_id" => manufacturer4.id,
  "component" => "spoke",
  "cost" => 4,
  "price" => 6,
  # "margin" => 4,
  "quantity" => 49,
  "low_stock" => 50,
  "critical_stock" => 25
})
item3.save()
item4 = Item.new({
  "manufacturer_id" => manufacturer3.id,
  "component" => "tyre",
  "cost" => 25,
  "price" => 35,
  # "margin" => 2,
  "quantity" => 60,
  "low_stock" => 20,
  "critical_stock" => 10
})
item4.save()
item5 = Item.new({
  "manufacturer_id" => manufacturer3.id,
  "component" => "inner-tube",
  "cost" => 5,
  "price" => 7,
  # "margin" => 2,
  "quantity" => 5,
  "low_stock" => 20,
  "critical_stock" => 10
})
item5.save()
item6 = Item.new({
  "manufacturer_id" => manufacturer2.id,
  "component" => "free-hub",
  "cost" => 55,
  "price" => 90,
  # "margin" => 2,
  "quantity" => 10,
  "low_stock" => 10,
  "critical_stock" => 5
})
item6.save()
item7 = Item.new({
  "manufacturer_id" => manufacturer4.id,
  "component" => "aero-blades",
  "cost" => 130,
  "price" => 175,
  # "margin" => 2,
  "quantity" => 2,
  "low_stock" => 5,
  "critical_stock" => 3
})
item7.save()
item8 = Item.new({
  "manufacturer_id" => manufacturer1.id,
  "component" => "carbon rim",
  "cost" => 165,
  "price" => 250,
  # "margin" => 2,
  "quantity" => 10,
  "low_stock" => 6,
  "critical_stock" => 3
})
item8.save()



binding.pry
nil
