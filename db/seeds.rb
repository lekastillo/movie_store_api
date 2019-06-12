# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Movie.all.count == 0
  Movie.create([{title: "The Godfather (1972)", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", status: 0, stock: 25, rental_price: 1.5, sale_price: 12.5, delayed_return_penalty_amount: 1.5},
  {title: "The Lord of the Rings: The Return of the King (2003)", description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.", status: 0, stock: 25, rental_price: 3.5, sale_price: 10.5, delayed_return_penalty_amount: 0.5},
  {title: "The Dark Knight (2008)", description: "When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.", status: 0, stock: 25, rental_price: 4.5, sale_price: 12, delayed_return_penalty_amount: 1.25},
  {title: "The Godfather: Part II (1974)", description: "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.", status: 0, stock: 25, rental_price: 1.5, sale_price: 8.5, delayed_return_penalty_amount: 2},
  {title: "Psycho (1960)", description: "A Phoenix secretary embezzles forty thousand dollars from her employer's client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.", status: 0, stock: 25, rental_price: 1.25, sale_price: 9.5, delayed_return_penalty_amount: 0.5},
  {title: "Star Wars (1977)", description: "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.", status: 0, stock: 25, rental_price: 1.5, sale_price: 5.5, delayed_return_penalty_amount: 1},
  {title: "The Matrix (1999)", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", status: 0, stock: 25, rental_price: 2.6, sale_price: 3.25, delayed_return_penalty_amount: 2.60},
  {title: "Terminator 2: Judgment Day (1991)", description: "A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her teenage son, John Connor, from a more advanced and powerful cyborg.", status: 0, stock: 25, rental_price: 2.75, sale_price: 10.5, delayed_return_penalty_amount: 2.75}])
end

if User.all.count == 0
  User.create(full_name: 'Luis Castillo', email: 'user@email.com', password: '123123123', password_confirmation: '123123123')
end
if Admin.all.count == 0
  Admin.create(full_name: 'Root Amin', email: 'root@admin.com', password: '123123123', password_confirmation: '123123123')
end
