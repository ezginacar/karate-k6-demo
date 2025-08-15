function() {
  var Faker = Java.type('com.github.javafaker.Faker');
  var f = new Faker();

  return {
    getBoardName: function() { return f.gameOfThrones().character(); },
    getCardName: function() { return f.color().name(); },
    getOrganizationName: function() { return f.company().name(); },
    getListName: function() { return f.aviation().airport(); }
  }
}