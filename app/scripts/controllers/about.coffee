'use strict'

###*
 # @ngdoc function
 # @name ankuragrawalApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the ankuragrawalApp
###
ankuragrawalApp
  .controller 'AboutCtrl', ($scope, $rootScope, about) ->
    $rootScope.landing = false

    $scope.toVars =
      left: 0

    $scope.about = about

    $scope.getImageUrl = (imagename, extension = 'svg', subdirectory = '') ->
      "#{this.getImageAssetUrl()}about/#{subdirectory}/#{imagename}.#{extension}"

    $scope.getProfileImageUrl = ->
      this.getImageUrl 'ankur', 'jpg'

    $scope.getHobbyImageUrl = (hobby) ->
      this.getImageUrl hobby, 'svg', 'hobbies'

    $scope.getExperienceImageUrl = (experience) ->
      this.getImageUrl experience, 'svg', 'experiences'

     # - Noel Delgado | @pixelia_me
    $scope.init = ->
      setTimeout ->
        nodes  = document.querySelectorAll '.direction-aware-container li'
        _nodes = [].slice.call nodes, 0

        # bind events
        _nodes.forEach (el) ->
          el.addEventListener 'mouseover', (ev) ->
              _addClass ev, this, 'in'
          , false

          el.addEventListener 'mouseout', (ev) ->
              _addClass ev, this, 'out'
          , false
      , 100
      return

    _getDirection = (ev, obj) ->
      w = obj.offsetWidth
      h = obj.offsetHeight
      # console.log w + ", " + h
      # console.log "  " + ev.pageX + ", " + ev.pageY
      # console.log "  " + (obj.offsetLeft - $("sticky-scroll").scrollLeft()) + ", " + (obj.offsetTop - $("sticky-scroll").scrollTop())
      x = (ev.pageX - obj.offsetLeft - 33 + $("sticky-scroll").scrollLeft() - ((w / 2) * (if w > h then (h / w) else 1)))
      y = (ev.pageY - obj.offsetTop - 50 + $("sticky-scroll").scrollTop() - ((h / 2) * (if h > w then (w / h) else 1)))
      # console.log "  " + (ev.pageX - obj.offsetLeft - 33 + $("sticky-scroll").scrollLeft()) + ", " + (ev.pageY - obj.offsetTop - 50 + $("sticky-scroll").scrollTop())
      d = (Math.round( Math.atan2(y, x) / 1.57079633 + 5 ) % 4)
      d

    _addClass = ( ev, obj, state ) ->
      direction = _getDirection ev, obj
      class_suffix = ""

      obj.className = ""

      switch direction
        when 0
          class_suffix = '-top'
        when 1
          class_suffix = '-right'
        when 2
          class_suffix = '-bottom'
        when 3
          class_suffix = '-left'

      obj.classList.add( state + class_suffix )
      return

    $scope.init()
