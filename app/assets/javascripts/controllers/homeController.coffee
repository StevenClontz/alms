angular.module('alms.controllers').controller("HomeController", [
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