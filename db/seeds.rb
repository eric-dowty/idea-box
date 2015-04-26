users =  [
          {name: "Tom", username: "t45", password: "p", password_confirmation: "p", role: 0}, 
          {name: "Kat", username: "Kt9", password: "p", password_confirmation: "p", role: 0},
          {name: "Sue", username: "UuS", password: "p", password_confirmation: "p", role: 1}, 
          {name: "Sam", username: "AM1", password: "p", password_confirmation: "p", role: 1}, 
          {name: "Boo", username: "bUo", password: "p", password_confirmation: "p", role: 0}
         ]

users.each do |data|
  User.create(data)
end

categories = %w(Work Home Hobby Fitness Food Random)

categories.each do |data|
  Category.create(name: data)
end

categories_in_db = Category.all.pluck(:id)
users_in_db = User.all.pluck(:id)

ideas = [
         {title: "Chocolate", description: "something good", user_id: users_in_db.sample, category_id: categories_in_db.sample},
         {title: "Rain",      description: "something wet", user_id: users_in_db.sample, category_id: categories_in_db.sample },
         {title: "Baseball",  description: "something old", user_id: users_in_db.sample, category_id: categories_in_db.sample },
         {title: "Thunder",   description: "very loud", user_id: users_in_db.sample, category_id: categories_in_db.sample     },
         {title: "Dogs",      description: "awesome", user_id: users_in_db.sample, category_id: categories_in_db.sample       },
         {title: "Cats",      description: "I hate cats", user_id: users_in_db.sample, category_id: categories_in_db.sample   },
         {title: "Java Bean", description: "Good icecream", user_id: users_in_db.sample, category_id: categories_in_db.sample },
         {title: "Chicken",   description: "cluck cluck", user_id: users_in_db.sample, category_id: categories_in_db.sample   },
         {title: "Cow",       description: "Mooooooo!!!!", user_id: users_in_db.sample, category_id: categories_in_db.sample  },
         {title: "frisbee",   description: "I like it", user_id: users_in_db.sample, category_id: categories_in_db.sample     },
         {title: "Apollo",    description: "NASA missions", user_id: users_in_db.sample, category_id: categories_in_db.sample },
         {title: "Blog Post", description: "booooring", user_id: users_in_db.sample, category_id: categories_in_db.sample     },
         {title: "Football",  description: "fun to play", user_id: users_in_db.sample, category_id: categories_in_db.sample   },
         {title: "Seed data", description: "hope its good", user_id: users_in_db.sample, category_id: categories_in_db.sample },
         {title: "burritos",  description: "spicy is best", user_id: users_in_db.sample, category_id: categories_in_db.sample },
        ]

ideas.each do |data|
  Idea.create(data)
end