App.MyModalComponent = Ember.Component.extend({

  isPresent: '',

  onIsPresentChange: function () {
    // so this is pretty sweet. isPresent is set to a certain
    // value when declaring the component (if the dev wants to)
    // I use it for the auth modal. The isPresent value is then
    // updated when a user succesfully logs in or signs up
    if (this.get('isPresent') === false){
      this.$('.modal').modal('hide');
    }
  }.observes('isPresent'),

  show: function() {
    this.$('.modal').modal().on('hidden.bs.modal', function() {
      this.sendAction('close');
    }.bind(this));
  }.on('didInsertElement')
});