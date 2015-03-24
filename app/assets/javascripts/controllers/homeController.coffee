angular.module('alms.controllers').controller("HomeController", [
  'Workbook', (Workbook) ->

    @workbooks = []

    queryWorkbooks = (nameQuery) =>
      Workbook.query(name:nameQuery).then (workbooks) =>
        @workbooks = workbooks
    queryWorkbooks()
    @queryWorkbooks = queryWorkbooks

    @nameQuery = ''

    return
])