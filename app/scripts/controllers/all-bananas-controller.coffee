'use strict'

angular.module('bananaUpp')
  .controller 'AllBananasCtrl', ['$scope','BananasService', ($scope, bananasService) ->

    bananasService.getBananas()
      .then (bananas) =>
        $scope.bananas = bananas

  ]
