Feature: Create Board for the case study

  Background: Call required fields
    * call read('classpath:features/Board.feature')
    * def faker = call read('classpath:faker-helpers.js')
    * url baseUrl

  Scenario: Successful create a new board
    * path PostCreateList
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getListName()
    * param idBoard = boardID
    * request ''
    * method post
    * match $.id == "#notnull"
    * def listID = $.id
