Feature: list operations

  Background: Call required fields
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def board = call read('classpath:features/api/Board.feature@createBoard')
    * def faker = call read('classpath:faker-helpers.js')
    * url baseUrl


  @createList
  Scenario: Create a new list under the board
    * path PostCreateList
    * param name = karate.get('listName') || faker.getListName()
    * def boardId = karate.get('boardId') || board.id
    * param idBoard = boardId
    * request ''
    * method post
    * match $.id == "#notnull"
    * def result = { id: $.id, name: $.name, boardId: $.idBoard }
