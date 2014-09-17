App.UserRoundPrediction = DS.Model.extend({
  user_id: DS.attr('number'),
  round_id: DS.attr('number'),
  prediction_type: DS.attr('number'),
  predicted_contestant_id: DS.attr('number'),
  comment: DS.attr('string')

  // fullName: function() {
  // return this.get('firstName') + ' ' + this.get('lastName');
  // }.property('firstName', 'lastName')

});