App.AuthenticationModalController = Ember.Controller.extend({

  title: "",
  isLoginModal: null,
  isPresent: null,
  isProcessing: false,
  loginFailed: false,
  signupFailed: false,
  isSlowConnection: false,
  timeout: null,

  actions: {
    goToLogin: function() {
      this.set('title', 'Login');
      this.clearModal();
      this.set('isLoginModal', true);
    },
    goToSignup: function() {
      this.set('title', 'Signup');
      this.clearModal();
      this.set('isLoginModal', false);
    },
    login: function() {

      this.setProperties({
        loginFailed: false,
        isProcessing: true
      });

      this.set("timeout", setTimeout(this.slowConnection.bind(this), 5000));

      var data = {
        user: this.getProperties('login', 'password')
      };

      $.post('users/sign_in.json', data).then(
        this.loginSuccess.bind(this), this.loginFailure.bind(this));
    },
    signup: function() {
      // this needs to be done upon success only.
      this.clearModal();
      this.closeModal();
      // and after, upon success, also actually login the user (or not... dunno)
    }
  },

  loginSuccess: function(response) {
    this.get('session').validate(response.user_token, response.user_email);
    this.resetStatus();
    this.clearModal();
    this.closeModal();
  },

  loginFailure: function(response) {
    this.resetStatus();
    this.set("loginFailed", true);
  },

  slowConnection: function() {
    this.set("isSlowConnection", true);
  },

  resetStatus: function() {
    clearTimeout(this.get("timeout"));
    this.setProperties({
      isProcessing: false,
      isSlowConnection: false
    });
  },

  clearModal: function() {
    this.setProperties({
      login: '',
      username: '',
      email: '',
      password: '',
      passwordConfirmation: ''
    });
  },

  closeModal: function() {
    this.set('isPresent', false);
  }
});