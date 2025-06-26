@appcontact_login
Feature: Login to app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Login
    Given path '/users/login'
    And request {"email": "holafer@test.com", "password": "casacasa"}
    When method POST
    Then status 200
    And match response ==
    """
    {
      {
         "id": '#string',
         "firstName": '#string',
         "lastName": '#string',
         "email": '#string',
         "__v": '#number',
      },
      "token": '#string'
    }
    """
