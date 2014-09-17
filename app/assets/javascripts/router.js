// For more information see: http://emberjs.com/guides/routing/

App.Router.reopen({
	location: 'auto',
	rootURL: '/'
});


App.Router.map(function() {

	this.route('home', { path: '/'});

	this.resource('tournaments', { path: '/tournaments' }, function() {
		this.resource('tournament', { path: '/tournaments/:id' });
	});

});

// / # just the index with like login etc
// /ladder/ # just the ladder (find out how to paginate it)
// /tournaments/:id # show main page with all stuff
// /tournaments/:id/rounds # main structure of rounds with ones starting earlier on top
// /tournaments/:id/rounds/:id # add info about round, like when it starts, round type etc
// /tournaments/:id/rounds/:id/brackets # what a brackets round looks like (list of groups)
// /tournaments/:id/rounds/:id/brackets/:group_id # list all matches of a group in a the brackets round
// /tournaments/:id/rounds/:id/quarter-finals # what a quarter-final round looks like with data from matches too...
// /tournaments/:id/rounds/:id/semi-finals # what a semi-final round looks like with data from matches too...
// /tournaments/:id/rounds/:id/final # what a final round looks like with 