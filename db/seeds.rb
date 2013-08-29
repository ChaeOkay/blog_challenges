

tag1 = Tag.create(name: "ConfedofDunces")

i = 1
3.times do
  post = Post.create(title: "Post Title #{i}", body:"I am at the moment writing a lengthy indictment against our century. When my brain begins to reel from my literary labors, I make an occasional cheese dip. #{i}")
  post.tags << tag1
  i += 1
end

tag2 = Tag.create(name: "9Stories")
tag3 = Tag.create(name: "ForEsme")

5.times do
   post = Post.create(title: "Post Title #{i}", body: "He said I was unequipped to meet life because I had no sense of humor. #{i}")
  post.tags << tag2
  post.tags << tag3
  i += 1
end

another_post = Post.create(title: "Post Title last", body: "They talk about cells as if they had such unlimited importance all by themselves.")
another_post.tags << tag2
