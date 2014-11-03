// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require ./app

// for more details see: http://emberjs.com/guides/application/
App = Ember.Application.create({rootElement: '#ember-app'});

App.Session = Ember.Object.extend({

  isAuthenticated: false,
  userToken: "",
  userEmail: "",

  init: function() {
    // if userToken and userEmail are found
    // in the local storage, set isAuthenticated to true
  },

  invalidate: function() {
    this.get('isAuthenticated', false);
    this.get('userToken', "");
    this.get('userEmail', "");
  }
});

App.register('session:main', App.Session);
App.inject('adapter', 'session', 'session:main');
App.inject('route', 'session', 'session:main');
App.inject('controller', 'session', 'session:main');
App.inject('view', 'session', 'session:main');

//= require_tree .

// this just adds a hook to the Ember views that assures
// me that the jQuery will be run after all the child elements
// of the view have been rendered
Ember.View.reopen({
  didInsertElement : function(){
    this._super();
    Ember.run.scheduleOnce('afterRender', this, this.afterRenderEvent);
  },
  afterRenderEvent : function(){
    // implement this hook in your own subclasses and run your jQuery logic there
  }
});