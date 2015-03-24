angular.module('alms',[

  'templates', # angular-rails-templates
  'ui.router', # ui-router
  'alms.controllers', # alms controllers
  'alms.directives', # alms directives

])


angular.module('alms.directives',[])


angular.module('alms.controllers',[

  'rails' #angularjs-rails-resource

])