'use strict'

angular.module('bananaUpp', ['ngRoute'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/history',
        templateUrl: 'views/history.html'
        controller: 'HistoryCtrl'
      .when '/latest',
        templateUrl: 'views/one-banana.html'
        controller: 'OneBananaCtrl'
      .when '/banana/:day',
        templateUrl: 'views/one-banana.html'
        controller: 'OneBananaCtrl'
      .when '/all',
        templateUrl: 'views/all-bananas.html'
        controller: 'AllBananasCtrl'
      .otherwise
        redirectTo: '/latest'
  ]
