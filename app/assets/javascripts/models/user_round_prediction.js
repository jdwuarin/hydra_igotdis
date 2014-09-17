App.UserRoundPrediction = DS.Model.extend({
  roundId: DS.attr('number'),
  predictionType: DS.attr('number'),
  predictedContestantType: DS.attr('string'),
  predictedContestantId: DS.attr('number'),
  comment: DS.attr('string')

  // fullName: function() {
  // return this.get('firstName') + ' ' + this.get('lastName');
  // }.property('firstName', 'lastName')

});

// will look something like

// App.UserRoundPrediction = DS.Model.extend({
//   round: DS.belongsTo('round'),
//   prediction_type: DS.attr('number'),
//   predicted_contestant_type: DS.attr('string'),
//   predicted_contestant_id: DS.attr('number'), 
//   comment: DS.attr('string')

// });