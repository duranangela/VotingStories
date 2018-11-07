# VotingStories

This application displays headlines for news stories having to do with the upcoming midterm election on Nov 6. News information is acquired from the [NewsAPI](https://newsapi.org/). It gives a signed-in user the ability to star articles which saves them as favorites, and then the user can see and/or delete their favorites.

This project was built with Ruby on Rails (Ruby 2.4.1, Rails 5.2.1). It uses a postgresql database.

### Local Setup
If you would like run this project locally please follow these steps:   
 - `git clone git@github.com:duranangela/VotingStories.git`  
 - `cd VotingStories`  
 - `rake db:{create,migrate}`   
 - `rails s`   

Your project should be available to view at [localhost:3000](http://localhost:3000/).

To run the test suite:   
 - `rspec`

### Endpoints
This project has two endpoints, for adding and deleting favorites from the database:

#### POST '/api/v1/users/:user_id/favorites'
Submission should be in the following format:
```json
{"favorite":
	{	"title": "some title",
		"source": "a source",
		"url": "something.com"
	}
}
```

#### DELETE '/api/v1/users/:users_id/favorites/:id'

### Screenshots

#### Home Page
<img width="1163" alt="screen shot 2018-11-07 at 7 30 30 am" src="https://user-images.githubusercontent.com/35884097/48137393-342dfe00-e25f-11e8-9b1d-0ec9f1642c2f.png">

#### Favorites Page
<img width="1164" alt="screen shot 2018-11-07 at 7 33 16 am" src="https://user-images.githubusercontent.com/35884097/48137517-80793e00-e25f-11e8-990f-30e983d1f00b.png">



