App.TournamentsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('tournament');
  }
});