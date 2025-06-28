Feature: Reusable login

Background:
  * url baseUrl
  * header Accept = 'application/json'

Scenario: Get auth token
  Given path '/users/login'
  And request { email: "holafer@test.com", password: "casacasa" }
  When method POST
  Then status 200
  * def token = response.token
  * match token contains '.'
