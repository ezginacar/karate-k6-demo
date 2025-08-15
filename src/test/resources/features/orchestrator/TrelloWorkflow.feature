@e2e
Feature: E2E Case Study - Complete Trello Workflow

  Background: Setup test data
    * def faker = call read('classpath:helpers/faker-helpers.js')

  Scenario: Complete E2E Test - Create Organization, Board, List, Cards, Update and Cleanup

    # Step 1: Create Organization
    * print '\033[1;36m=== Step 1: Create An Organization ===\033[0m'
    * def organization = call read('classpath:features/api/Organization.feature@createOrganization') { name: faker.getOrganizationName() }
    * print "A new organization created with id:  >>>", organization.result.id

    # Step 2: Create Board
    * print '\033[1;36m=== Step 2: Creating Board ===\033[0m'
    * def board = call read('classpath:features/api/Board.feature@createBoard') { idOrganization: '#(organization.result.id)', boardName: faker.getBoardName() }
    * print "A new board created with id:  >>>", board.id

    # Step 3: Create List
    * print '\033[1;36m=== Step 3: Create List ===\033[0m'
    * def list = call read('classpath:features/api/List.feature@createList') { boardId: board.id, listName: faker.getListName() }
    * print "A new list created with id:  >>>", list.id

    # Step 4: Create First Card
    * print '\033[1;36m=== Step 4: Create First Card ===\033[0m'
    * def card1 = call read('classpath:features/api/Card.feature@createCard') { idList: list.id, name: faker.getCardName() }
    * print "A new card created with id:  >>>", card1.id

    # Step 5: Create Second Card
    * print '\033[1;36m=== Step 5: Create Second Card ===\033[0m'
    * def card2 = call read('classpath:features/api/Card.feature@createCard') { idList: list.id, name: faker.getCardName() }
    * print "A new card created with id:  >>>", card2.id

    # Step 6: Get Card Details Before Update
    * print '\033[1;36m=== Step 6: Getting Card Details Before Update ===\033[0m'
    * def before = call read('classpath:features/api/Card.feature@getCardDetails') { id: card1.id }
    * def cardNameBefore = before.result.name
    * print "The first card name is:  >>>", cardNameBefore

    # Step 7: Update Card Name
    * def updatedCard = call read('classpath:features/api/Card.feature@updateCardName') { id: card1.id, name: faker.getCardName() }
    * match updatedCard.result.id == card1.result.id
    * match updatedCard.result.name != cardNameBefore
    * print 'Card Name Updated Successfully. New Card Name is: >> ', updatedCard.name

    # Step 8: Delete Cards
    * call read('classpath:features/api/Card.feature@deleteCard') { id: card1.id }
    * print `The first card (${card1.result.id}) is deleted successfully`

    * call read('classpath:features/api/Card.feature@deleteCard') { id: card2.id }
    * print `The second card (${card2.result.id}) is deleted successfully`

    # Step 9: Delete Board
    * call read('classpath:features/api/Board.feature@deleteBoard') { id: board.id }
    * print `The board id (${board.result.id}) is deleted successfully`

    # Step 10: Delete Organization
    * print '\033[1;36m=== Step 10: Deleting Organization ===\033[0m'
    * call read('classpath:features/api/Organization.feature@deleteOrganization') { id: organization.id }





 
  


                
                
              
    
    







