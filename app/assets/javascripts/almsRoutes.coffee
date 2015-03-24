angular.module('alms').config(
  ['$stateProvider', '$urlRouterProvider', '$locationProvider',
    ($stateProvider, $urlRouterProvider, $locationProvider) ->

      # Use hashbang mode
      $locationProvider.html5Mode(false).hashPrefix('!');

      # For any unmatched url, redirect to /home
      $urlRouterProvider.otherwise("/home")

      # Set up the states
      $stateProvider
        .state('home',
          url: "/home"
          templateUrl: "home.html"
          controller: "HomeController as homeScope"
          data:
            title: 'Home'
        )

])