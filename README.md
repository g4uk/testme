# README

### "Test Me" application

A simple Rails API-only app with integrated GraphQL into it. Includes a simple
 CRUD for model `Contract` using needed operations (queries and mutations).

`Contract` has following attributes:
- status (postgres enum)
- name (string)
- start_date (date)
- avg_monthly_price (decimal, precision: 8, scale: 2)

Validation requirements:
- status: required, allowed values: draft & signed
- name: required, unique, maximum 255 characters
- start_date: required, only today or future dates are allowed
- avg_monthly_price: not required

Requirements:
- use form object pattern for validations
- use service object pattern for business logic
- use input object for GraphQL mutation arguments (when send attributes for creating and updating object)
- use Rubocop
- includes documentation to GraphQL for new types (query, mutation, 
enum, input object)
- test API calls and unit tests

----

### How to run (development mode)

- ```bundle install```
- ```rake db:setup & rake db:migrate & rake db:seed```
- ```rails s```

Postgresql must be installed.
- API testing tools: ```http://127.0.0.1:3000/graphiql```
- API endpoint: ```/graphql```

Examples of requests:

- Create a new Contract
```
mutation {
 createContract(contract: {status: draft, name: "test4", startDate: "2023-03-03"}) {
   contract {
     id
     status,
     startDate
   },
   errors
 }
}
```
- Update Contract
```
mutation {
  updateContract(id: 3, contract: {status: signed, name: "test1", startDate: "2023-03-03", avgMonthlyPrice: 12.8}) {
    contract {
      status
      startDate,
      avgMonthlyPrice
    }
    errors
  }
}
```
- Delete Contract
```
mutation {
  deleteContract(id: 3) {
    errors
  }
}
```
- Get Contract by ID
```
query {
  contract(id: 6) {
    status,
    name
  }
}
```
- Get all contracts
```
query {
  contracts {
    status,
    name
  }
}
```
