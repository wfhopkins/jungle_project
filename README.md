# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.
Implementing multiple bug fixes and features to the base code, style adjustments and introducing cypress for testing.

## Screenshots

![Jungle Homepage](https://github.com/wfhopkins/jungle_project/blob/main/docs/Jungle%20Home.png?raw=true)
###Homepage


![Product Panes](https://github.com/wfhopkins/jungle_project/blob/main/docs/Product%20Panes.png?raw=true)
###Product Panes


![Item in Cart](https://github.com/wfhopkins/jungle_project/blob/main/docs/Item%20in%20Cart.png?raw=true)
###Item in Cart


![About Page](https://github.com/wfhopkins/jungle_project/blob/main/docs/Jungle%20About.png?raw=true)
###About Page


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
Ensure the expiry is set to a future date eg. 12/34 or if checking for decline error, a past date.
The CVV can be any 3 digitis.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
