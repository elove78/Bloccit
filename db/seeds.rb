require 'faker'

unique_post = { 
      title: "This is final test that i did in the last hour",
      body: "blah blah"
    }

Post.find_or_create_by(unique_post)



unique_comment = {
  body: "blah try 1 2 3"
}


Post.find_or_create_by(unique_comment)

 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
