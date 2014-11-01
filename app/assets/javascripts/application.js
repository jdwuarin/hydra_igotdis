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