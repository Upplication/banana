'use strict'

angular.module('bananaUpp')
  .controller 'OneBananaCtrl', ['$scope','BananasService', '$routeParams', ($scope, bananasService, $routeParams) ->


    requestedBanana = $routeParams.day

    _serveBanana = (banana, latest) ->
      if banana

        banana.url = bananasService.getBasePath() + '/' + banana.day + '/' + banana.index
        banana.latest = latest
        $scope.banana = banana

      else
        $scope.banana = undefined


    if requestedBanana
      # Serves requested banana
      bananasService.getBanana(requestedBanana)
        .then (banana) =>
          _serveBanana(banana, false)

    else
      # Serves latest banana
      bananasService.getLatestBanana()
        .then (banana) =>
          _serveBanana(banana, true)

  ]
