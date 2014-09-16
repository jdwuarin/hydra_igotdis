App.UserRoundPrediction = DS.Model.extend({
  name: DS.attr('string'),
  startDate: DS.attr('date'),
  endDate: DS.attr('date'),
  continent_id: DS.attr('string'),
  tournament_type: DS.attr('number'),
  has_groups: DS.attr('boolean'),
  group_count: DS.attr('number')

  // fullName: function() {
  // return this.get('firstName') + ' ' + this.get('lastName');
  // }.property('firstName', 'lastName')

});