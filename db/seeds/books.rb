print "Books Table"
print " => Cleaning Data"

Reservation.delete_all
Book.delete_all

print " => Seeding"

100.times do |i|
    Book.create!(
        title: Faker::Book.unique.title,
        author: Faker::Book.unique.author,
        sku: Faker::Barcode.unique.upc_a,
        price: Faker::Commerce.price(range: 20.0..100.0),
        stock: rand(1..10)
    )
    if i%10 == 0
        print "."
    end
end
puts ""