// declare a new module called 'myApp', and make it require the `ng-admin` module as a dependency
var myApp = angular.module('myApp', ['ng-admin']);
// declare a function to run when the module bootstraps (during the 'config' phase)
myApp.config(['NgAdminConfigurationProvider', function (nga) {
    // create an admin application
    var admin = nga.application('Mufficator')
      .baseApiUrl('http://localhost:3000/'); // main API endpoint
    // create a muffin entity
    // the API endpoint for this entity will be 'http://jsonplaceholder.typicode.com/muffins/:id
    var muffin = nga.entity('muffins').identifier(nga.field('_id'));
    // set the fields of the muffin entity list view

    muffin.listView().fields([
        nga.field('name').isDetailLink(true),
        nga.field('description'),
        nga.field('size'),
    ]);

    muffin.creationView().fields([
    nga.field('name'),
    nga.field('description'),
    nga.field('size','choice')
      .label('Size of muffin')
      .choices([
        { label: 'Small', value: 'S' },
        { label: 'Medium', value: 'M' },
        { label: 'Large', value: 'L' }
       ]),
    nga.field('origin.country').label('Country of origin'),
    nga.field('origin.city').label('City of origin')
  ]);

  muffin.editionView().fields(muffin.creationView().fields());

    // add the muffin entity to the admin application
    admin.addEntity(muffin);
    nga.configure(admin);
}]);
