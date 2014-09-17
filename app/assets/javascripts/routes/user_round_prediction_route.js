App.UserRoundPredictionRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('user_round_prediction',
                           params.user_round_prediction_id);
  }
});