App.UserRoundPredictionsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('user_round_prediction');
  }
});