# Posts model and controller
	- title
	- content
	- author
	- date published
	- status
	- categories
	- tags(for tag cloud)
	- comments
	- bookmarks (button that saves bookmark and increments counter in db)
	- star rating
	- approx read time ( how to calculate? )

rails g model Post title:string content:text rating:integer read_time:string status:string user:references
rails g migration AddSlugToPosts slug:string
rails g controller posts index show create update destroy


rails g model Category name:string
rails g controller categories 

users have one account
	- Account Model
		- ?
users have many blog posts