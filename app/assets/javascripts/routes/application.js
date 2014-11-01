App.ApplicationRoute = Ember.Route.extend({
  actions: {
    showModal: function(name, content) {
      this.controllerFor(name).set('content', content);

      // just the specific setup for authentication modals
      if (name === 'authentication-modal') {
        if (content === 'login'){
          this.showLoginModal();
        } else if(content === 'signup') {
          this.showSignupModal();
        }
      }
      this.render(name, {
        into: 'application',
        outlet: 'modal'
      });
    },
    removeModal: function() {
      this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    }
  },

  showSignupModal: function() {
    name = 'authentication-modal';
    model = Ember.Object.create({username: '',
                                 email: '',
                                 password: '',
                                 passwordConfirmation: '' });
    this.controllerFor(name).set('content', model);
    this.controllerFor(name).set('isLoginModal', false);
    this.controllerFor(name).set('isPresent', true);
    this.controllerFor(name).set('title', 'Signup');
  },
  showLoginModal: function() {
    name = 'authentication-modal';
    model = Ember.Object.create({login: '',
                                 password: ''});
    this.controllerFor(name).set('content', model);
    this.controllerFor(name).set('isLoginModal', true);
    this.controllerFor(name).set('isPresent', true);
    this.controllerFor(name).set('title', 'Login');
  }
});