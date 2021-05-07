print "Books Table"
print " => Cleaning Data"

Book.delete_all

print " => Seeding"

100.times do |i|
    Book.create!(
        title: Faker::Book.title,
        author: Faker::Book.author,
        sku: Faker::Barcode.upc_a,
        price: Faker::Commerce.price(range: 20.0..100.0),
        stock: rand(1..10)
    )
    if i%10 == 0
        print "."
    end
end
puts ""