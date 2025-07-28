Feature: Create Card for the case study

  Background: Set required fileds
    * call read('classpath:features/List.feature')
    * def faker = call read('classpath:faker-helpers.js')
    * url baseUrl

  Scenario: Successful create 2 cards under the board
    * path PostCreateCard
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getCardName()
    * param idList = listID
    * request ''
    * method post
    * match $.id == "#notnull"
    * def cardID1 = $.id


    * url baseUrl
    * path PostCreateCard
    * header Accept = 'application/json'
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getCardName()
    * param idList = listID
    * request ''
    * method post
    * match $.id == "#notnull"
    * def cardID2 = $.id


    * def result = { cardID1: cardID1, cardID2: cardID2 }
    * karate.set('cardResult', result)




