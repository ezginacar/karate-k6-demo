@caseStudy
Feature: Case study

  Background: Get required IDs - js libraries

    * def faker = call read('classpath:faker-helpers.js')
    * url baseUrl
    * call read('classpath:features/Card.feature')



  Scenario: Case Study (update one of card's name than remove cards and boards)
   * def endpoint = PutUpdateCard
   * def endpoint = endpoint.replace('${id}', cardResult.cardID1)
   * path endpoint
   * param token = accessToken
   * param key = apiKey
   * request ''
   * method get
   * status 200
   * def cardNameBefore = $.name
 
 
   * url baseUrl
   * path endpoint
   * param token = accessToken
   * param key = apiKey
   * param name = faker.getCardName()
   * request ''
   * method put
   * match response.name != cardNameBefore

    #delete created board, card

    * def endpoint2 = DeleteOrganization
    * def endpoint2 = endpoint2.replace('${id}', organizationID.organizationID)
    * path endpoint2
    * param token = accessToken
    * param key = apiKey
    * request ''
    * method delete
    * status 200

   * def endpoint3 = DeleteBoard
   * def endpoint3 = endpoint3.replace('${id}', boardID)
   * path endpoint3
   * param token = accessToken
   * param key = apiKey
   * request ''
   * method delete
   * status 200

   #assertion
    * path endpoint
    * param token = accessToken
    * param key = apiKey
    * request ''
    * method get
    * status 404
    
    







