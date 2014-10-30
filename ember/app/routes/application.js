import Ember from 'ember';
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin);

// window.App = Ember.Application.create({
//   LOG_TRANSITIONS: true,
//   LOG_TRANSITIONS_INTERNAL: true,
//   LOG_VIEW_LOOKUPS: true
// });