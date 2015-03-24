angular.module('alms.controllers').controller("HomeController", [
  'Workbook', '$state', (Workbook, $state) ->

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