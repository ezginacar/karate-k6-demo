Feature: Create an organization to add board

  Background: Set token
    * def faker = call read('classpath:faker-helpers.js')

  Scenario: Successful create a new organization
    Given url baseUrl
    * path PostCreateOrganization
    * param key = apiKey
    * param token = accessToken
    * param displayName = faker.getOrganizationName()
    * request ''
    * method post
    * match $.id == "#notnull"
    * def organizationID = $.id
    * print "organizaton id >>>", organizationID
    * karate.set('organizationID', organizationID)