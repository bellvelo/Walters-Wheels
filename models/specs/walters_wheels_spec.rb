require 'minitest/autorun'
require_relative '../item'
require_relative '../manufacturer'

class TestItem < Minitest::Test

def setup
  options = {
    # "manufacturer_id" => manufacturer1.id,
    "component" => "rim",
    "cost" => 20,
    "price" => 30,
    "margin" => 2,
    "quantitiy" => 30,
    "low_stock" => 10,
    "critical_stock" => 6
  }
  @item = Item.new(options)
end

def test_sale_price
  @item1 = Item.new({
    # "manufacturer_id" => manufacturer1.id,
    "component" => "rim",
    "cost" => 20,
    "price" => 30,
    "margin" => 2,
    "quantitiy" => 5,
    "low_stock" => 10,
    "critical_stock" => 6
  })
  assert_equal(40, @item1.sale_price())

end
def test_stock_level()
  @item1 = Item.new({
    # "manufacturer_id" => manufacturer1.id,
    "component" => "rim",
    "cost" => 20,
    "price" => 30,
    "margin" => 2,
    "quantitiy" => 5,
    "low_stock" => 10,
    "critical_stock" => 6
  })
  assert_equal("REORDER NOW", @item1.stock_level())
end


# def test_component()
#   assert_equal("rim", @manufacturer.component())
# end
#
# def test_cost()
#   assert_equal("cost", @manufacturer.cost())
# end
#
# def test_price()
#   assert_equal("price", @manufacturer.price())
# end

#this is the end
end
