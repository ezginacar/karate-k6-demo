Feature: Organization operations

  Background: Set token
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def faker = call read('classpath:faker-helpers.js')

  @createOrganization
  Scenario: Create a new organization
    Given url baseUrl
    * path PostCreateOrganization
    * param displayName = karate.get('organizationName') || faker.getOrganizationName()
    * request ''
    * method post
    * match $.id == "#notnull"
    * def result = { id: $.id, name: $.displayName }


  @deleteOrganization
  Scenario: Delete organization by id
    * def organizationID = karate.get('id')
    * path DeleteOrganization.replace('${id}', organizationID)
    * request ''
    * method delete
    * status 200
    * def result = { id: organizationID }
    * print `The organization (${organizationID}) is deleted successfully`