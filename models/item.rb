require_relative('../db/sql_runner')
require('pry')

class Item

attr_reader :id
attr_accessor :manufacturer_id, :component, :cost, :price, :margin, :quantity, :low_stock, :critical_stock

def initialize(options)
  @id = options["id"].to_i
  @manufacturer_id = options["manufacturer_id"].to_i
  @component = options["component"]
  @cost = options["cost"].to_i
  @price = options["price"].to_i
  # @margin = options["margin"].to_i
  @quantity = options["quantity"].to_i
  @low_stock = options["low_stock"].to_i
  @critical_stock = options["critical_stock"].to_i
end

def markup
  gross_profit = @price - @cost
  mark_up = (gross_profit/@cost.to_f)*100
  # binding.pry
  return mark_up.round(0).to_i
end

def stock_level()
  # define warning statements
  low_level = "LOW STOCK"
  critical_level = "REORDER NOW"
  # if quantity is less than or equal to critical_stock
  # return low_stock warning
  if @quantity <= @critical_stock
    return critical_level
  # else if quantity is less than or equal to low_stock
  # return critical_stock warning
  elsif @quantity <= @low_stock
    return low_level
  # else return 'OK'
  else
    return "OK"
  end
end

def man_name()
  man_name = Manufacturer.find(@manufacturer_id)
  return man_name
end

def self.all()
  sql = "SELECT * FROM items"
  items = SqlRunner.run(sql)
  result = items.map {|item| Item.new(item)}
  return result
end

def self.by_profit()
  sql = "SELECT * FROM items ORDER BY markup"
  items = SqlRunner.run(sql)
  result = items.map {|item| Item.new(item).sort}
  return result
end

def self.find(id)
  sql = "SELECT * FROM items WHERE id = $1"
  values = [id]
  item = SqlRunner.run(sql, values)
  result = Item.new(item.first)
  return result
end

def self.get_by_man(manufacturer)
  sql = "SELECT * FROM items WHERE manufacturer_id = $1"
  values = [manufacturer]
  result = SqlRunner.run(sql, values)
  return result.map {|item| Item.new(item)}

end

def save()
  sql = "INSERT INTO items
    (
      manufacturer_id,
      component,
      cost,
      price,

      quantity,
      low_stock,
      critical_stock
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING *"
    values = [@manufacturer_id, @component, @cost, @price, @quantity, @low_stock, @critical_stock]
    item_data = SqlRunner.run(sql, values)
    @id = item_data.first()['id'].to_i

end

def update()
  sql = "UPDATE items
  SET
  (
    manufacturer_id,
    component,
    cost,
    price,

    quantity,
    low_stock,
    critical_stock
  ) = ($1, $2, $3, $4, $5, $6, $7)
  WHERE id = $8"
  values = [@manufacturer_id, @component, @cost, @price, @quantity, @low_stock, @critical_stock, @id]
  item_data = SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM items;"
    SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM items
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

#this is the end
end
