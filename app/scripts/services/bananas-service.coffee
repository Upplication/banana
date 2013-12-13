'use strict'

class BananasService


  constructor: ($http, $q, $filter) ->

    #Private variables
    basePath = "bananas"
    file = "config.json"
    filePath = "#{basePath}/#{file}"
    bananas = []

    _orderBananas = ->
      bananas = $filter('orderBy')(bananas, 'day')

    _findLatestBanana = ->
      if bananas and bananas.length then bananas[bananas.length - 1] else undefined

    _findBanana = (day) ->
      result = $filter('filter')(bananas, {day:day})
      if result and result.length then result[0] else undefined

    _prepareBananas = ->
      length = bananas.length
      for banana, i in bananas
        banana.order = i + 1
        if i > 0
          banana.prev = bananas[i-1].day
        if i < length - 1
          banana.next = bananas[i+1].day

    # Initializes this service, and resolves a promise(loadingPromise) when done, so consumers have to wait until it
    @init = =>
      deferred = $q.defer()

      $http.get(filePath)
        .then (response) =>

          bananas = response.data.bananas

          do _orderBananas
          do _prepareBananas

          do deferred.resolve
        , ->
          console.error "create \'#{filePath}\' file !!!"
          deferred.reject 'config file not found'

      @loadingPromise = deferred.promise


    # Fires initialization
    do @init

    # Returns the loadingPromise which will be fullfilled when service is successfully loaded
    @waitUntilLoaded = ->
      @loadingPromise


    #Returns a promise with an array of all the bananas
    BananasService::getBananas = ->
      @waitUntilLoaded()
        .then =>
          bananas

    #Returns a promise with the latest banana
    BananasService::getLatestBanana = ->
      @waitUntilLoaded()
        .then =>
          _findLatestBanana()

    #Returns a promise with an specific banana, filter by day
    BananasService::getBanana = (day) ->
      @waitUntilLoaded()
        .then =>
          _findBanana(day)


    #Returns the base path
    BananasService::getBasePath = ->
      basePath



angular.module('bananaUpp').service 'BananasService', ['$http', '$q', '$filter', BananasService]


