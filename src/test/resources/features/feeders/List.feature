Feature: list operations

  Background: Call required fields
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def faker = call read('classpath:helpers/faker-helpers.js')

  @createList
  Scenario: Create a new list under the board
    * path PostCreateList
    * param name = (typeof listName != 'undefined' && listName ? boardName : faker.getListName())
    #Determine board ID based on available parameters
    * def boardId = (typeof boardID != 'undefined' && boardID ) ? boardID : (typeof boardId != 'undefined' && boardId) ? boardId  : (typeof id != 'undefined' && id) ? id : null)
    * param idBoard = boardId
    * request ''
    * method post
    * status 200
    * match $.id == "#notnull"
    * def result = { id: '#(response.id)', name: '#(response.displayName)', boardId: '#(response.idBoard)' }
    * print "List created with ID:", result.id
