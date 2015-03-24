angular.module('alms.resources').factory('Workbook',
  ['RailsResource', (RailsResource) ->

    class Workbook extends RailsResource
      @configure
        url: '/api/v1/workbooks'
        name: 'workbook'

])