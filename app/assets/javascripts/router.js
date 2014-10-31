// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.route('login');
  this.resource('users');
  this.resource('tournaments', { path: '/' });
});
