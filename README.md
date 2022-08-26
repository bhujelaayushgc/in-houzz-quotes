# in-Houzz Quotes - Quotes Russian Roulette :gun:

URL: https://in-houzz-quotes.herokuapp.com/quotes

---

This is a Full-stack ROR app which returns a random quote from the awesome list of quotes :sunglasses:

## Architecture Overview:

- Application consists of **single Controller** - `quotes` with single action - `index`.
- Application exposes **two routes**:
  - `GET /`
  - `GET /quotes[.json|.xml]`
- Application **does not have a Database**. The data is from the dataset provided (`quotes.csv` which is on the root of the project).
- Application consists of **a helper/utility module** inside `lib` called `csv_parser.rb`.

  - The primary objective of this module is:
    - Parse the csv file
    - Load it to a variable as Array
    - Sample from that array and return a Hash

  > The quotes are preloaded at the beginning and stored in a variable as an Array. This was done in order to avoid frequint File I/O. Since the csv was not mutable (or did not have actions to update the csv), I took the liberty to assume that it is static data and can be pre-loaded.

  > It has space implications but for this size and situation, I think it is fine.

- The single action inside the `quotes_controller` has Rails helper responder to decide what content-type to return, html or json or xml.
- Application has single view, `quotes/index.html.erb`

## Specifications

- Ruby Version: 3.1.2
- Rails Version: 7.0.3
- Database: N/A
- Datasource: quotes.csv

### Dependencies

- CSS: Tailwind
- Unit Test
  - RSpec: Test Framework
  - Rails Controller Testing: To test render template
  - rexml: XML parser for testing

## Repository Branch

- `main`: Release branch
- `develop`: Next release (staging)

## Development / Local Run

### Pre-requisites (using Docker)

- Docker
- Docker Compose

### Steps

- Clone the repository
- Run:
  ```
  $ docker-compose build
  $ docker-compose up
  ```

This will run the RoR application using the Procfile.dev. The application is binded to broadcast address 0.0.0.0 and runs on PORT 3000.

So, you can access it by going to url:

- `http://localhost:3000/quotes`
- `http://localhost:3000/quotes.json`
- `http://localhost:3000/quotes.xml`

OR,

- `http://localhost:3000` => Root route is routed to `quotes#index`

## Testing

This project uses RSpec for testing runs. Following tests are included:

- Controller/Request Spec for Quotes
- Routing Spec for Quotes

### How to run test suit (From docker container)

- Enter the container
  ```
  $ docker-compose exec app bash
  ```
- Run the test suit
  ```
  $ rspec
  ```

This should run both test specs.

## Continuous Integration - GitHub Actions

This project is using GitHub Actions to run the test suits (CI).

The GitHub actions is triggerd on:

- push on branches: ["develop", "test"]
- pull_request on branches: ["main"]
