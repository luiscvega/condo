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

app.factory('flash', function($rootScope) {
  $rootScope.flashQueue = [];
  $rootScope.currentFlash = '';

  $rootScope.$on('$routeChangeSuccess', function() {
    if ($rootScope.flashQueue.length > 0)
      $rootScope.currentFlash = $rootScope.flashQueue.shift();
    else
      $rootScope.currentFlash = '';
  });

  return {
    set: function(message) {
      $rootScope.flashQueue.push(message);
    },
    get: function() {
      return $rootScope.currentFlash;
    },
    now: function(message) {
      $rootScope.currentFlash = message;
    },
    unset: function() {
      $rootScope.currentFlash = '';
    }
  };
});

app.run(function($rootScope, flash) {
  $rootScope.flash = flash;
});

app.controller('SessionCtrl', function($scope, $http, $location, flash) {
  $scope.submitLogin = function() {
    $http.post('/login', $scope.user).
      success(function(data, status, headers, config){
        flash.set(data.message);
        $location.path("/");
      }).
      error(function(data, status, headers, config) {
        flash.now(data.message);
      });
  };

});

app.controller('TenantCtrl', function($scope, $http) {

});
