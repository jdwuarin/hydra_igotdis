App.FavoritesRoute = Ember.Route.extend({
  model: function() {
    // the model is an Array of all of the tournaments
    return this.store.find('tournament');
  }
});