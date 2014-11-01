App.AuthenticationModalController = Ember.ObjectController.extend({

  isLoginModal: null,

  actions: {
    save: function() {
      // save to server
    },
    goToLogin: function() {
      this.set('isLoginModal', true);
    },
    goToSignup: function() {
      this.set('isLoginModal', false);
    },
  }
});