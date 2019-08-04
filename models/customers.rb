require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :customer_name, :funds
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_name = options['customer_name']
    @funds = options['funds'].to_i
  end


  def save()

    sql = "INSERT INTO customers (customer_name, funds)
    VALUES($1, $2) RETURNING id"

    values = [@customer_name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

   def self.all()
     sql = "SELECT * FROM customers"
     customers = SqlRunner.run(sql, values)
     result = customers.map{|customer| Customer.new(customer)}
   end

   def self.delete_all()
     sql = "DELETE FROM customers"
     SqlRunner.run(sql)
   end

   def self.find_by_id(id)
     sql = 'SELECT * FROM customers WHERE id = $1'
     values = [id]
     customers = SqlRunner.run(sql, values)
     return Customer.new(customers[0])
   end

   def update()

     sql = "UPDATE customers SET(customer_name, funds) = ($1, $2)
     WHERE id = $3"

     values = [@customer_name, @funds, @id]

     SqlRunner.run(sql, values)
   end

   def delete()

     sql = "DELETE FROM customers WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql, values)

   end

   def films()

     sql = "SELECT films.* FROM films INNER JOIN tickets
      ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
      values = [@id]

      films = SqlRunner.run(sql, values)
      return films.map{|film| Film.new(film)}
    end

  end
