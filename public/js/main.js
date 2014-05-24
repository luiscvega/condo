'use strict';

var app = angular.module('condoApp', ['ngRoute']);

app.config(function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'login',
      controller: 'LoginCtrl'
    });
});

app.controller('LoginCtrl', function($scope, $http) {
  $scope.user = {email: '', password: ''};

  $scope.submitLogin = function() {
    $http.post('/login', $scope.user).
      success(function(data, status, headers, config){
        console.log('Logged in' + data);
      }).
      error(function(data, status, headers, config) {
        console.log(data);
      });
  };

});
