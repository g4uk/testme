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
