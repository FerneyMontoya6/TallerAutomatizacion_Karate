@appcontact_createcontact
Feature: Create contact in the app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer logs in and creates a contact
    # Login
    Given path '/users/login'
    And request { "email": "holafer@test.com", "password": "casacasa" }
    When method POST
    Then status 200
    * def authToken = response.token

    # Create contact
    Given path '/contacts'
    And header Authorization = 'Bearer ' + authToken
    And request 
    """
    {
      "firstName": "Christian",
      "lastName": "Gomez",
      "birthdate": "1970-01-01",
      "email": "jdoe@fake.com",
      "phone": "8005555555",
      "street1": "1 Main St.",
      "street2": "Apartment A",
      "city": "Anytown",
      "stateProvince": "KS",
      "postalCode": "12345",
      "country": "USA"
    }
    """
    When method POST
    Then status 201
    And match response.firstName == "Christian"
