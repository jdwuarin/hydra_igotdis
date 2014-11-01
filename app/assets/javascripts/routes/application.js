App.ApplicationRoute = Ember.Route.extend({
  actions: {
    showModal: function(name, content) {
      this.controllerFor(name).set('content', content);
      // just the specific setup for authentication modals
      if (name === 'authentication-modal') {
        this.controllerFor(name).set('isLoginModal', content);
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
  }
});