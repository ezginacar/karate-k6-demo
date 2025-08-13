Feature: Board operations

  Background: Call required fields
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def organization =  call read('classpath:features/api/Organization.feature@createOrganization')
    * def faker = call read('classpath:faker-helpers.js')

  @createBoard
  Scenario: Create a new board
    * path PostCreateBoard
    * param name = karate.get('boardName') || faker.getBoardName()
    * def orgId = karate.get('idOrganization') || organization.id
    * param idOrganization = orgId
    * request ''
    * method post
    * match $.id == "#notnull"
    * def result = { id: $.id, name: $.name, organizationId: $.idOrganization }

  @deleteBoard
  Scenario: Delete board by id
    * def boardId = karate.get('id')
    * path DeleteBoard.replace('${id}', boardId)
    * request ''
    * method delete
    * status 200
    * def result = { id: boardId }
