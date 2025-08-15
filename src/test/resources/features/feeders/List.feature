Feature: list operations

  Background: Call required fields
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def faker = call read('classpath:helpers/faker-helpers.js')

  @createList
  Scenario: Create a new list under the board
    * path PostCreateList
    * def listName = (typeof listName != 'undefined' && listName ? listName : faker.getListName())
    * param idBoard = boardId
    * param name = listName
    * request ''
    * method post
    * status 200
    * match $.id == "#notnull"
    * def result = { id: '#(response.id)', name: '#(response.displayName)', boardId: '#(response.idBoard)' }
    * print "List created with ID:", result.id
