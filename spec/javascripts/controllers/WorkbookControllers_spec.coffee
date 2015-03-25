describe "WorkbookShowController", ->
  scope        = null
  ctrl         = null
  httpBackend  = null

  setupController = (hexId, mockRequestResponses) ->
    inject(($rootScope, $controller, $state, $httpBackend)->
      scope       = $rootScope.$new()
      stateParams = $state.params

      stateParams.hexId = hexId

      httpBackend = $httpBackend

      if mockRequestResponses
        for pair in mockRequestResponses
          httpBackend.whenGET(pair[0]).respond(pair[1])

      ctrl        = $controller('WorkbookShowController as workbookShowScope',
                                $scope: scope)
    )

  beforeEach(module("alms"))
  mockRequestResponses = [
    [
      new RegExp(".*workbooks/.*$")
      {"id":1,"name":"foo","description":"bar"}
    ]
  ]


  describe "when visiting a workbook show page", ->
    beforeEach ->
      setupController('abcde12345', mockRequestResponses)
      httpBackend.flush()
    it 'finds a workbook', ->
      expect(scope.workbookShowScope.workbook.name).toNgEqual('foo')


  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()