describe "HomeController", ->
  scope        = null
  ctrl         = null
  httpBackend  = null

  setupController = (mockRequestResponses, query) ->
    inject(($rootScope, $controller, $stateParams, $httpBackend)->
      scope       = $rootScope.$new()
      stateParams = $stateParams
      stateParams.name = query

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

  describe "when no query specified", ->
    beforeEach ->
      setupController(mockRequestResponses)
      httpBackend.flush()
    it 'defaults all workbooks', ->
      expect(scope.homeScope.workbooks.length).toNgEqual(3)

  describe 'with matching query specified', ->
    query = 'SHoRt'
    beforeEach ->
      setupController(mockRequestResponses, query)
      httpBackend.flush()
    it 'finds appropriate number of matches', ->
      expect(scope.homeScope.workbooks.length).toNgEqual(1)

  describe 'with nonmatching query specified', ->
    query = 'klgIOUGIgiougiug'
    beforeEach ->
      setupController(mockRequestResponses, query)
      httpBackend.flush()
    it 'finds no matches', ->
      expect(scope.homeScope.workbooks.length).toNgEqual(0)

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()