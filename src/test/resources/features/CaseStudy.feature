@caseStudy
Feature: E2E Case Study - Complete Trello Workflow

  Background: Setup test data
    * def faker = call read('classpath:faker-helpers.js')
    * url baseUrl

  Scenario: Complete E2E Test - Create Organization, Board, List, Cards, Update and Cleanup
    
    # Step 1: Create Organization
    * print '\033[1;36m=== Step 1: Creat An Organization ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * path PostCreateOrganization
    * param displayName = faker.getOrganizationName()
    * request ''
    * method post
    * match $.id == "#notnull"
    * def organizationID = $.id
    * print "A new organization created with id:  >>>", organizationID

    
    # Step 2: Create Board
    * print '\033[1;36m=== Step 2: Creating Board ===\033[0m'
    * path PostCreateBoard
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getBoardName()
    * param idOrganization = organizationID
    * request ''
    * method post
    * status 200
    * def boardID = $.id
    * print "A new board created with id:  >>>", boardID

    
    # Step 3: Create List
    * print '\033[1;36m=== Step 3: Create List ===\033[0m'
    * path PostCreateList
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getListName()
    * param idBoard = boardID
    * request ''
    * method post
    * status 200
    * def listID = $.id
    * print "A new list created with id:  >>>", listID

    
    # Step 4: Create First Card
    * print '\033[1;36m=== Step 4: Create First Card ===\033[0m'
    * path PostCreateCard
    * param key = apiKey
    * param token = accessToken
    * param name = faker.getCardName()
    * param idList = listID
    * request ''
    * method post
    * status 200
    * def cardID1 = $.id
    * print "A new card created with id:  >>>", cardID1

    
    # Step 5: Create Second Card
    * print '\033[1;36m=== Step 5: Create Second Card ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * path PostCreateCard
    * param name = faker.getCardName()
    * param idList = listID
    * request ''
    * method post
    * status 200
    * def cardID2 = $.id
    * print "The second card created with id:  >>>", cardID2

    
    # Step 6: Get Card Details Before Update
    * print '\033[1;36m=== Step 6: Getting Card Details Before Update ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * def endpoint = PutUpdateCard.replace('${id}', cardID1)
    * path endpoint
    * request ''
    * method get
    * status 200
    * def cardNameBefore = $.name
    * print "The first card name is:  >>>", cardNameBefore
    
    # Step 7: Update Card Name
    * print '\033[1;36m=== Step 7: Update Card Name ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * url baseUrl
    * def endpoint = PutUpdateCard.replace('${id}', cardID1)
    * path endpoint
    * param name = faker.getCardName()
    * request ''
    * method put
    * match response.name != cardNameBefore
    * print 'Card Name Updated Successfully. New Card Name is: >> ', response.name
    
    # Step 8: Delete Cards
    * print '\033[1;36m=== Step 8: Delete Cards ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * def endpoint = DeleteCard.replace('${id}', cardID1)
    * path endpoint
    * request ''
    * method delete
    * status 200
    * print `The first card (${cardID1}) is deleted successfully`

    * def endpoint = DeleteCard.replace('${id}', cardID2)
    * param key = apiKey
    * param token = accessToken
    * path endpoint
    * request ''
    * method delete
    * status 200
    * print `The second card (${cardID2}) is deleted successfully`
    
    # Step 9: Delete Board
    * print '\033[1;36m=== Step 9: Deleting Board ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * def endpoint = DeleteBoard.replace('${id}', boardID)
    * path endpoint
    * request ''
    * method delete
    * status 200
    * print `The board (${boardID}) is deleted successfully`
    
    # Step 10: Delete Organization
    * print '\033[1;36m=== Step 10: Deleting Organization ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * def endpoint = DeleteOrganization.replace('${id}', organizationID)
    * path endpoint
    * request ''
    * method delete
    * status 200
    * print `The organization (${organizationID}) is deleted successfully`
    
    # Step 11: Verify Card is Deleted
    * print '\033[1;36m=== Step 11: Verify Card is Deleted ===\033[0m'
    * param key = apiKey
    * param token = accessToken
    * path PostCreateCard
    * request ''
    * method get
    * status 404
    * print '\033[1;30m✓ Card deletion verified - 404 received\033[0m'
    
  


                
                
              
    
    







