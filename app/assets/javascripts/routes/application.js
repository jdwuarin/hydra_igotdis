App.ApplicationRoute = Ember.Route.extend({
  actions: {

    invalidateSession: function() {
      this.get('session').invalidate();
    },

    showModal: function(name, content, title) {

      this.controllerFor(name).set('content', content);

      // just the specific setup for authentication modals
      if (name === 'authentication-modal') {
        if (content === 'login'){
          this.showLoginModal();
        } else if(content === 'signup') {
          this.showSignupModal();
        }
      }
      if (title !== undefined){
        this.controllerFor(name).set('title', title);
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
    this.controllerFor(name).set('isLoginModal', false);
    this.controllerFor(name).set('isPresent', true);
    this.controllerFor(name).set('title', 'Signup');
  },
  showLoginModal: function() {
    name = 'authentication-modal';
    this.controllerFor(name).set('isLoginModal', true);
    this.controllerFor(name).set('isPresent', true);
    this.controllerFor(name).set('title', 'Login');
  }
});