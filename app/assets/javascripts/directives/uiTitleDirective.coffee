angular.module('alms.directives').directive('uiTitle',
  ['$rootScope', '$timeout', ($rootScope, $timeout) ->

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