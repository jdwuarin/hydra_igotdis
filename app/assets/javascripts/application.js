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
  justLoggedIn: false,
  justLoggedOut: false,
  inTimeout: null,
  outTimeout: null,

  init: function() {
    // if userToken and userEmail are found
    // in the local storage, set isAuthenticated to true
    var token = localStorage.userToken;
    var email = localStorage.userEmail;
    if (token !== "" && email !== ""){
      this.set('userToken',token);
      this.set('userEmail', email);
      this.set('isAuthenticated', true);
    }
  },

  // this just makes sure that the locaStorage
  // is updated when it should be.
  userAuthChanged: function() {
    localStorage.userToken = this.get('userToken');
    localStorage.userEmail = this.get('userEmail');
  }.observes('userToken', 'userEmail'),

  validate: function(userToken, userEmail){
    this.set('userToken', userToken);
    this.set('userEmail', userEmail);
    this.set('isAuthenticated', true);
    this.set('justLoggedIn', true);
    this.set("inTimeout", setTimeout(
      this.resetInTimeout.bind(this), 3000));
  },

  invalidate: function() {
    this.set('isAuthenticated', false);
    this.set('userToken', "");
    this.set('userEmail', "");
    this.set('justLoggedOut', true);
    this.set("outTimeout", setTimeout(
      this.resetOutTimeout.bind(this), 3000));
  },

  resetInTimeout: function() {
    this.set('justLoggedIn', false);
    clearTimeout(this.get('inTimeout'));
  },

  resetOutTimeout: function() {
    this.set('justLoggedOut', false);
    clearTimeout(this.get('outTimeout'));
  },

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