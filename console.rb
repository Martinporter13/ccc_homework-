
require_relative('./models/customers.rb')
require_relative('./models/films.rb')
require_relative('./models/tickets.rb')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'customer_name' => 'Martin Porter', 'funds' => 100})
customer1.save()
customer2 = Customer.new({ 'customer_name' => 'Lionel Messi', 'funds' => 10000})
customer2.save()

film1 = Film.new({ 'title' => 'Inception', 'price' => 10})
film1.save()
film2 = Film.new({ 'title' => 'Spider-Man', 'price' => 10})
film2.save()


ticket1 = Ticket.new ({'customer_id' => customer1.id,
  'film_id' => film1.id
    })
ticket1.save()
ticket2 = Ticket.new ({'customer_id' => customer2.id,
  'film_id' => film2.id
  })
  ticket2.save()

  customer1.customer_name = "Cristiano"
  customer1.update

  film1.title = "Shutter Island"
  film2.update

  ticket1.customer_id = customer2.id
  ticket1.update 











binding.pry
nil
