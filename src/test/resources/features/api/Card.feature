
Feature: Card operations

  Background: Common setup
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def faker = call read('classpath:faker-helpers.js')

  @createCard
  Scenario: Create a card under the list
    * path PostCreateCard
    * param name = karate.get('name') || faker.getCardName()
    * param idList = karate.get('idList')
    * request ''
    * method post
    * match $.id == "#notnull"
    * def result = { id: $.id, name: $.name, listId: $.idList }

  @updateCardName
  Scenario: Update card name by id and return updated card
    * def cardId = karate.get('id')
    * def newName = karate.get('name') || faker.getCardName()
    * path PutUpdateCard.replace('${id}', cardId)
    * param name = newName
    * request ''
    * method put
    * status 200
    * match $.name == newName
    * def result = { id: $.id, name: $.name }

  @getCardDetails
  Scenario: Get card details
    * def cardId = karate.get('id')
    * path PutUpdateCard.replace('${id}', cardId)
    * request ''
    * method get
    * status 200
    * def result = { id: $.id, name: $.name }


  @deleteCard
  Scenario: Delete card by id
    * def cardId = karate.get('id')
    * path DeleteCard.replace('${id}', cardId)
    * request ''
    * method delete
    * status 200
    * def result = { id: cardId }






