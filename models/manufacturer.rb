require_relative('../db/sql_runner')

class Manufacturer

attr_reader :id
attr_accessor :name, :address, :phone

def initialize(options)
  @id = options["id"].to_i
  @name = options["name"]
  @address = options["address"]
  @phone = options["phone"]
end

def self.all()
  sql = "SELECT * FROM manufacturers"
  manufacturers = SqlRunner.run(sql)
  result = manufacturers.map {|manufacturer| Manufacturer.new(manufacturer)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM manufacturers WHERE id = $1"
  values = [id]
  manufacturer = SqlRunner.run(sql, values)
  result = Manufacturer.new(manufacturer.first)
  return result
end

def save()
  sql = "INSERT INTO manufacturers
    (
      name,
      address,
      phone
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @address, @phone]
    manufacturer_data = SqlRunner.run(sql, values)
    @id = manufacturer_data.first()['id'].to_i
end

def update()
  sql = "UPDATE manufacturers
  SET
  (
    name,
    address,
    phone
  ) = ($1, $2, $3)
  WHERE id = $4"
  values = [@name, @address, @phone, @id]
  manufacturer_data = SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM manufacturers;"
    SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM manufacturers
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

#this is the end
end
