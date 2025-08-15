
Feature: Card operations

  Background: Common setup
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def faker = call read('classpath:helpers/faker-helpers.js')

  @createCard
  Scenario: Create a card under the list
    * path PostCreateCard
    * param name = (typeof cardName != 'undefined' && cardName ? cardName : faker.getCardName())
    * param idList = karate.get('idList')
    * request ''
    * method post
    * status 200
    * match $.id == "#notnull"
    * def result = { id: '#(response.id)', name: '#(response.name)', listId: '#(response.idBList)' }
    * print "Card created with ID:", result.id

  @updateCardName
  Scenario: Update card name by id and return updated card
    * def cardId = karate.get('id')
    * def newName = (typeof cardName != 'undefined' && cardName ? cardName : faker.getCardName())
    * path PutUpdateCard.replace('${id}', cardId)
    * param name = newName
    * request ''
    * method put
    * status 200
    * match $.name == newName
    * def result = { id: '#(response.id)', name: '#(response.name)', listId: '#(response.idBList)' }
    * print "Card updated with new name:", response.name

  @getCardDetails
  Scenario: Get card details
    * def cardId = karate.get('id')
    * path PutUpdateCard.replace('${id}', cardId)
    * request ''
    * method get
    * status 200
    * def result = { id: '#(response.id)', name: '#(response.name)', listId: '#(response.idBList)' }
    * print "Card details retrieved for ID:", response.id

  @deleteCard
  Scenario: Delete card by id
    * def cardId = karate.get('id')
    * path DeleteCard.replace('${id}', cardId)
    * request ''
    * method delete
    * status 200
    * print 'The card (' + cardId + ') is deleted successfully'






