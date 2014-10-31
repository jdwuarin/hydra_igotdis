App.LoginRoute = Ember.Route.extend({
  model: function() {
    // this is where the sending of the credentials
    // to the backend has to occur
    return Em.Object.create({name: 'Mitch'});
  }
});