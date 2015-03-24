describe "HomeController", ->
  scope        = null
  ctrl         = null

  setupController = ->
    inject(($rootScope, $controller)->
      scope       = $rootScope.$new()

      ctrl        = $controller('HomeController as homeScope',
                                $scope: scope)
    )

  beforeEach(module("alms"))
  beforeEach(setupController())

  it 'defaults to no workbooks', ->
    expect(scope.homeScope.workbooks).toNgEqual([])