alms = angular.module('alms',[

  'templates', # angular-rails-templates
  'ui.router', # ui-router
  'alms.controllers', # alms controllers
  'alms.directives', # alms directives

]).config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

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


almsDirectives = angular.module('alms.directives',[])


almsControllers = angular.module('alms.controllers',[

  'rails' #angularjs-rails-resource

])