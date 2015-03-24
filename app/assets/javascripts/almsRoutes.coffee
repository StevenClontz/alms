angular.module('alms').config(
  ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

    # For any unmatched url, redirect to /home
    $urlRouterProvider.otherwise("/home")

    # Set up the states
    $stateProvider
      .state('home',
        url: "/home?name"
        templateUrl: "home.html"
        controller: "HomeController as homeScope"
        data:
          title: 'Home'
      )

])