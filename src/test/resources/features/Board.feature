Feature: Create Board for the case study

  Background: Call required fields
    * call read('classpath:features/Organization.feature')
    * def faker = call read('classpath:faker-helpers.js')
    * url baseUrl

  Scenario: Successful create a new board
    * path PostCreateBoard
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getBoardName()
    * param idOrganization = organizationID
    * request ''
    * method post
    * match $.id == "#notnull"
    * def boardID = $.id
