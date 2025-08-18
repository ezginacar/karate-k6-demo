Feature: Organization operations

  Background: Set token
    Given url baseUrl
    * param key = apiKey
    * param token = accessToken
    * def naming = call read('classpath:helpers/naming-helper.js')

  @createOrganization
  Scenario: Create a new organization
    Given url baseUrl
    * path PostCreateOrganization
    * param displayName = (typeof name != 'undefined' && name) ? name : naming.getStandartNaming('Organization')
    * request {}
    * method post
    * status 200
    * match response.id == "#present"
    * print "EZO  " , response.id
    * def result = { id: '#(response.id)', name: '#(response.displayName)' }
    * print "Organization created with ID:", result.id

  @deleteOrganization
  Scenario: Delete organization by id
    * def organizationID = karate.get('id')
    * path DeleteOrganization.replace('${id}', organizationID)
    * request ''
    * method delete
    * status 200
    * print 'The organization (' + organizationID + ') is deleted successfully'