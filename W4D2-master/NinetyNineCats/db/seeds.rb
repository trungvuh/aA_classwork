# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

cat1 = Cat.create(birth_date: '2001/01/01', color: 'black', name: 'garfield', sex: 'M', description: 'aaa')
cat2 = Cat.create(birth_date: '2002/02/02', color: 'white', name: 'trung', sex: 'M', description: 'bbb')
cat3 = Cat.create(birth_date: '2003/03/03', color: 'brown', name: 'jack', sex: 'M', description: 'ccc')
cat4 = Cat.create(birth_date: '2004/04/04', color: 'yellow', name: 'rachel', sex: 'F', description: 'ddd')
cat5 = Cat.create(birth_date: '2005/05/05', color: 'white', name: 'alice', sex: 'F', description: 'eees')

CatRentalRequest.destroy_all

CatRentalRequest.create(cat_id: cat1.id, start_date: '2017/10/20', end_date: '2017/10/22')
CatRentalRequest.create(cat_id: cat2.id, start_date: '2017/10/18', end_date: '2017/10/20')
CatRentalRequest.create(cat_id: cat3.id, start_date: '2017/10/16', end_date: '2017/10/22')
CatRentalRequest.create(cat_id: cat1.id, start_date: '2017/10/23', end_date: '2017/10/22')
