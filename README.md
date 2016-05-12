# Build an Olympics results dashboard

The goal of this challenge is to build a Ruby API which can be used to display results and upcoming events from the next Olympics.

The API will support a JavaScript application to:

- Display events which are coming up.
- View the sports that are currently in progress.
- When viewing a given sport, display results from previous games/races.

Eg. Basketball -> USA are currently playing Australia, 1hr ago Brazil defeated China 89-76, 2hrs ago Russia defeated Japan 102-101. Next game is USA vs Spain in 4 hours.

## Usage

0. Pull down the project, and ensure you have `ruby-2.3` installed
1. Inside the project folder, run `bundle install`
2. Run `rake db:setup`
3. Run `rake db:populate`
4. Run `rails s`
5. Using your favourite REST client, send a `GET` request to `localhost:3000`

## Testing

To run the test suite, run `rspec` inside the project folder
