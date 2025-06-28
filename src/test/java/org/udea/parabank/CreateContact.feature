Feature: Create contact in app contact

Background:
  * url baseUrl
  * header Accept = 'application/json'
  * def result = call read('login-reusable.feature')
  * def authToken = result.token

Scenario: Create contact
  Given path '/contacts'
  And header Authorization = 'Bearer ' + authToken
  And request {
    "firstName": "Christian",
    "lastName": "Gomez",
    "birthdate": "1970-01-01",
    "email": "jdoe" + (Math.floor(Math.random() * 10000)) + "@fake.com",
    "phone": "8005555555",
    "street1": "1 Main St.",
    "street2": "Apartment A",
    "city": "Anytown",
    "stateProvince": "KS",
    "postalCode": "12345",
    "country": "USA"
  }
  When method POST
  Then status 201
