App.ApplicationStore = DS.Store.extend({

});

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1',

  headers: function() {
    return {
      "Authorization": 'Token token="' + this.get('session').userToken + '",' +
        'user_email="' + this.get('session').userEmail + '"'
    };
  }.property("session")
});