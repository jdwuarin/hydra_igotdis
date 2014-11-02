App.AuthenticationModalController = Ember.Controller.extend({

  title: "",
  isLoginModal: null,
  isPresent: null,

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

      var data = {
        user: {
          login: this.get('login'),
          password: this.get('password')
        }
      };

      Ember.$.post('users/sign_in.json', data).then(function(response) {
        alert('got a response');
      });

      this.clearModal();
      this.closeModal();

    },
    signup: function() {
      // this needs to be done upon success only.
      this.clearModal();
      this.closeModal();
    }
  },

  clearModal: function() {
    this.set('login', '');
    this.set('username', '');
    this.set('email', '');
    this.set('password', '');
    this.set('passwordConfirmation', '');
  },

  closeModal: function() {
    this.set('isPresent', false);
  }
});