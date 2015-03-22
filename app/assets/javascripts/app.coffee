alms = angular.module('alms',[

  'templates', # angular-rails-templates
  'ui.router', # ui-router
  'alms.controllers', # alms controllers

]).config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

  # For any unmatched url, redirect to /home
  $urlRouterProvider.otherwise("/home")

  # Set up the states
  $stateProvider
    .state('home',
      url: "/home"
      templateUrl: "home.html"
      controller: "HomeController as _Home_"
      data:
        title: 'Home'
    )
    .state('foo',
      url: "/foo"
      templateUrl: "foo.html"
      data:
        title: 'Bar'
    )
    # .state('state2',
    #   url: "/state2",
    #   templateUrl: "state2.html"
    # )
    # .state('state2.list',
    #   url: "/list"
    #   templateUrl: "state2.list.html"
    # )
]).directive('uiTitle', ['$rootScope', '$timeout', ($rootScope, $timeout) ->
  # see http://stackoverflow.com/a/23814161/1607849
  # $timeout hack required for history compatibility
  {
    link: (scope, element) ->

      listener = (event, toState) ->

        title = 'alms'
        if toState.data && toState.data.title
          title = "#{toState.data.title} | alms"

        $timeout -> element.text title

      $rootScope.$on('$stateChangeSuccess', listener)

  }
])


almsControllers = angular.module('alms.controllers',[
]).controller("HomeController", [
  ->
    @name = 'dude'
])