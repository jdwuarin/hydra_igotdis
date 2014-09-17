App.UserRoundPredictionsNewController = Ember.Controller.extend({
  actions: {
    createUserRoundPrediction: function() {
      var urp = this.store.createRecord('user_round_prediciton', {
        roundId: 2,
        predictionType: this.get('predictionType'),
        predictedContestantType: "Team",
        predictedContestantId: this.get('predictedContestantId'),
        comment: ""
      });
      var self = this;
      post.save().then(function() {
        console.log('user_round_prediciton created!');
        self.transitionTo('post', post);
        self.set('predictionType', '');
        self.set('predictedContestantId', '');
      }, function() {
        alert('failed to create prediction!');
      });
    }
  }
});