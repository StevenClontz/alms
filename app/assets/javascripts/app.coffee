alms = angular.module('alms',[
  'templates', # angular-rails-templates
  'ui.router', # ui-router
  'alms.controllers', # alms controllers

]).config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

  # For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/state1")

  # Set up the states
  $stateProvider
    .state('home',
      url: "/home"
      templateUrl: "home.html"
      controller: "HomeController as _Home_"
    )
    # .state('state1.list',
    #   url: "/list"
    #   templateUrl: "state1.list.html"
    # )
    # .state('state2',
    #   url: "/state2",
    #   templateUrl: "state2.html"
    # )
    # .state('state2.list',
    #   url: "/list"
    #   templateUrl: "state2.list.html"
    # )
])


almsControllers = angular.module('alms.controllers',[
  ]).controller("HomeController", [
    ->
      @name = 'dude'
])