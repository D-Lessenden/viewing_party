# Viewing Party

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3. It was completed by [Judith Pillado,](https://github.com/judithpillado) [her LinkedIn can be found here](https://www.linkedin.com/in/judith-pillado/) and [Daniel Lessenden.](https://github.com/D-Lessenden/) [His LinkedIn profile](https://www.linkedin.com/in/lessenden/).

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's. All movie data is provided by the [The Movie DB API](https://www.themoviedb.org/). 


## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)


## Setup Instructions


First, set up a local server in your terminal: 

```
git clone git@github.com:judithpillado/viewing_party.git
cd viewing_party
bundle install
rails db:{drop,create,migrate,seed}
rails s
```

Then, in your browser: go to `localhost:3000`

## How to Setup a Viewing Party

Login with this account

```
example user
email
password
```
Go to the Discover Movies Page. Search for the film you would like to see. Click on that movie's link and then click `Create Viewing Party`


## Project Goals 

1. Consume JSON APIs that require authentication 
2. Build an application that requires basic authentication
3. Organize and refactor code to be more maintainable 
4. Implement a self-referential relationship in ActiveRecord 
5. Apply RuboCop’s style guide for code quality 
6. Utilize Continuous Integration using Travis CI 
7. Deploy to [Heroku](https://viewing-party-d-j.herokuapp.com/) 
