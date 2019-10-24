  
user1 = User.create(name: "djames", password: "password", email: "dj@e.com")
user2 = User.create(name: "etan", password: "password", email: "et@e.com")

user1.tweets.create(content: "my first tweet")
user1.tweets.create(content: "my second tweet")
user1.tweets.create(content: "my third tweet")
user2.tweets.create(content: "my first tweet")
user2.tweets.create(content: "my second tweet")
user2.tweets.create(content: "my third tweet")