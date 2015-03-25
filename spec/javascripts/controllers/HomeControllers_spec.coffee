describe "HomeController", ->
  scope        = null
  ctrl         = null
  httpBackend  = null

  setupController = (mockRequestResponses) ->
    inject(($rootScope, $controller, $httpBackend)->
      scope       = $rootScope.$new()

      httpBackend = $httpBackend

      if mockRequestResponses
        for pair in mockRequestResponses
          httpBackend.whenGET(pair[0]).respond(pair[1])

      ctrl        = $controller('HomeController as homeScope',
                                $scope: scope)
    )

  beforeEach(module("alms"))
  mockRequestResponses = [
    [
      new RegExp(".*workbooks$")
      [{"id":1,"name":"foo","description":"bar"},{"id":2,"name":"Couple of words","description":null},{"id":3,"name":"A short sentence","description":null}]
    ]
    [
      new RegExp(".*workbooks.*name=SHoRt$")
      [{"id":3,"name":"A short sentence","description":null}]
    ]
    [
      new RegExp(".*workbooks.*name=klgIOUGIgiougiug$")
      []
    ]
  ]


  describe "when visiting home page", ->
    beforeEach ->
      setupController(mockRequestResponses)
      httpBackend.flush()
    it 'defaults all workbooks', ->
      expect(scope.homeScope.workbooks.length).toNgEqual(3)
    it 'is searchable', ->
      scope.homeScope.queryWorkbooks('SHoRt')
      httpBackend.flush()
      expect(scope.homeScope.workbooks.length).toNgEqual(1)
      scope.homeScope.queryWorkbooks('klgIOUGIgiougiug')
      httpBackend.flush()
      expect(scope.homeScope.workbooks.length).toNgEqual(0)


  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()