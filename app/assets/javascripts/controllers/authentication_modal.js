App.AuthenticationModalController = Ember.Controller.extend({

  title: "",
  isLoginModal: null,

  actions: {
    goToLogin: function() {
      this.set('title', 'Login');
      this.set('isLoginModal', true);
    },
    goToSignup: function() {
      this.set('title', 'Signup');
      this.set('isLoginModal', false);
    },
    login: function() {
      this.set('login', '');
      this.set('password', '');
    },
    signup: function() {
      // this needs to be done upon success only.
      this.set('username', '');
      this.set('email', '');
      this.set('password', '');
      this.set('passwordConfirmation', '');
    }
  }
});