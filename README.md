# Book Turbine
https://bookturbine.com

Generates book recommendations.
=======
# README

- Install docker your favorite way.
- `cd` into the book-turbine directory.
- perform `docker compose build`.
- perform `docker compose up`.
- The application should launch, which includes doing any necessary database 
  preparation & seeding and then running the backend + frontend in foreman.
- run `docker exec -it book-turbine-web-1 bundle exec rspec spec` in another 
  terminal tab to run the tests. This requires that `docker compose up` is running.