alms = angular.module('alms',[

  'templates', # angular-rails-templates
  'ui.router', # ui-router
  'alms.controllers', # alms

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
    .state('foo',
      url: "/foo"
      templateUrl: "foo.html"
      data:
        title: 'Bar'
    )

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

  'rails' #angularjs-rails-resource

]).controller("HomeController", [
  'RailsResource', '$state', (RailsResource, $state) ->

    class Workbook extends RailsResource
      @configure url: '/api/v1/workbooks', name: 'workbook'

    @workbooks = []

    queryWorkbooks = (nameQuery) =>
      Workbook.query(name:nameQuery).then (workbooks) =>
        @workbooks = workbooks
    queryWorkbooks($state.params.name)
    @queryWorkbooks = queryWorkbooks

    @nameQuery = $state.params.name

    submitQuery = (nameQuery) ->
      $state.go 'home', {name: nameQuery}
    @submitQuery = submitQuery

    return
])