App.AuthenticatedRounte = App.ApplicationRoute.extend({
  // this pops up the signup modal whenever a 
  // user is unauthicated and trying to perform
  // an "authenticated" action.
  actions: {
    error: function(reason, transition) {
      if (reason.status === 401){
        this.send('showModal', 'authentication-modal',
          'signup', "Not signed up yet?");
      } else {
        alert('Something went wrong');
      }
    }
  }
});