import DS from 'ember-data';

// export default DS.RESTAdapter.extend({
// });

export default DS.ActiveModelAdapter.extend({
  namespace: 'api/v1',
  host: 'http://localhost:3000'
});