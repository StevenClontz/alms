angular.module('alms.controllers').controller("WorkbookShowController", [
  'Workbook', '$state', (Workbook, $state) ->

    @loading = true
    @workbook = new Workbook(name: 'Unknown Workbook')
    Workbook.get(id:$state.params.hexId).then (workbook) =>
      @workbook = workbook
      @loading = false

    return
])