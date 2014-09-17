App.Tournament = DS.Model.extend({
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

// App.Tournament.FIXTURES = [
//   {
//     id: 1,
//     name: 'LOL_WORLD_CUP',
//     startDate: new Date('10/18/2014 10:1 AM'),
//     endDate: new Date('10/28/2014 10:1 AM'),
//     continent_id: 1,
//     tournament_type: 0,
//     has_groups: true,
//     group_count: 4
//   },
//   {
//     id: 2,
//     name: 'Other_tournament',
//     startDate: new Date('11/18/2014 10:1 AM'),
//     endDate: new Date('11/28/2014 10:1 AM'),
//     continent_id: 1,
//     tournament_type: 0,
//     has_groups: true,
//     group_count: 4
//   }
// ];

// App.Lead.reopenClass({

//  valid: function(fields) {
//    return fields.firstName && fields.lastName
//  }

// });
