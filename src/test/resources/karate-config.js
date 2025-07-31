function fn() {

  var env = karate.env;
  if (!env) {
      env = 'test'; 
    }
    karate.log('Test environment :', env);


  var config = {
    env: env,
    baseUrl: 'https://api.trello.com',
    accessToken: karate.properties['trello.access.token'] || 'your-access-token',
    apiKey: karate.properties['trello.api.key'] || 'your-api-key',


    //endpoints
    PostCreateBoard : '/1/boards/',
    DeleteBoard : '/1/boards/${id}',
    PostCreateCard : '/1/cards',
    PutUpdateCard : '/1/cards/${id}',
    DeleteCard :'/1/cards/${id}',
    PostCreateOrganization : '/1/organizations/',
    DeleteOrganization : '/1/organizations/${id}',
    PostCreateList : '/1/lists'

  }

  if (env == 'test') {
    config.baseUrl ='https://api.trello.com'
  }

   karate.configure('headers', karate.read('classpath:header.js'));
   

   karate.configure('connectTimeout', 10000);
   karate.configure('readTimeout', 5000);

   // Debug modu için
   karate.configure('logPrettyRequest', true);
   karate.configure('logPrettyResponse', true);
   karate.configure('printEnabled', true);
   karate.configure('report', { showLog: true, showAllSteps: true });





  return config;
 }
