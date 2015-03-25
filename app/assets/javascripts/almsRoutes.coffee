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

        .state('workbooks',
          url: "/workbooks"
          abstract: true
          template: '<ui-view></ui-view>'
        )

        .state('workbooks.show',
          url: "/:hexId"
          templateUrl: "workbooks/show.html"
          controller: "WorkbookShowController as workbookShowScope"
          data:
            title: 'Workbook'
        )

])