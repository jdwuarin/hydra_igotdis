App.Tournament = DS.Model.extend({
	name: DS.attr('string'),
	startDate: DS.attr('date'),
	endDate: DS.attr('date'),
	continent_id: DS.attr('string'),
	tournament_type: DS.attr('integer')

	// fullName: function() {
	// return this.get('firstName') + ' ' + this.get('lastName');
	// }.property('firstName', 'lastName')

});

// App.Lead.reopenClass({

//	valid: function(fields) {
//		return fields.firstName && fields.lastName
//	}

// });
