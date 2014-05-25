'use strict';

var app = angular.module('condoApp', ['ngRoute']);

app.config(function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: 'templates/index',
    controller: 'TenantCtrl'
  })

  $routeProvider.when('/login', {
    templateUrl: 'templates/login',
    controller: 'SessionCtrl'
  });
});

app.controller('SessionCtrl', function($scope, $http, $location, $rootScope) {
  $scope.submitLogin = function() {
    $http.post('/login', $scope.user).
      success(function(data, status, headers, config){
        data.alert = 'success';
        $rootScope.flash = data;
        $location.path("/");
      }).
      error(function(data, status, headers, config) {
        data.alert = 'danger';
        $rootScope.flash = data;
      });
  };

});

app.controller('TenantCtrl', function($scope, $http) {

});
