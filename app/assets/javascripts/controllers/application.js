App.ApplicationController = Ember.Controller.extend({

  actions: {
    invalidateSession: function() {
      this.get('session').invalidate();
    },
  }

});