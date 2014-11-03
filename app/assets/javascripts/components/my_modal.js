App.MyModalComponent = Ember.Component.extend({

  isPresent: '',
  close: 'removeModal',

  onIsPresentChange: function () {
    // so this is pretty sweet. isPresent is set to a certain
    // value when declaring the component (if the dev wants to)
    // I use it for the auth modal. The isPresent value is then
    // updated when a user succesfully logs in or signs up
    if (this.get('isPresent') === false){
      this.$('.modal').modal('hide');
    }
  }.observes('isPresent'),

  // this takes care of hidding the modal when pressing escape
  didInsertElement: function(){
    $(document).on('keyup', { _self: this }, this.esc_close);
  },

  esc_close: function(e){
    // 27 is the escape key
    if(e.which == 27){
      e.data._self.set('isPresent', false);
    }
  },

  willDestroyElement: function(){
    $(document).off('keyup', this.esc_close);
  },

  /////////////////////////////////////////////////////////////

  show: function() {
    this.$('.modal').modal().on('hidden.bs.modal', function() {
      this.sendAction('close');
    }.bind(this));
  }.on('didInsertElement')
});