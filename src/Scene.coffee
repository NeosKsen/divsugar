DivSugar._Scene =
  _initialize: (@id) ->
    @style.margin = '0px'
    @style.padding = '0px'
    @style.position = 'relative'
    @style.overflow = 'hidden'
    @style[DivSugar.transformStyle] = 'preserve-3d'
    @style[DivSugar.transformOrigin] = '0% 0% 0%'
    @style[DivSugar.perspectiveOrigin] = '0% 0% 0%'

    @_size = {}

    @perspective 500

    return @

  size: (outerW, outerH, innerW, innerH) ->
    if arguments.length == 0
      return @_size
    else
      @_size.outerW = outerW
      @_size.outerH = outerH
      @_size.innerW = innerW
      @_size.innerH = innerH

      @style.width = "#{innerW}px"
      @style.height = "#{innerH}px"
      @style[DivSugar.transform] = "scale(#{outerW / innerW}, #{outerH / innerH})"

      return @

  perspective: (perspective) ->
    if arguments.length == 0
      return @_perspective
    else
      @_perspective = perspective
      @style[DivSugar.perspective] = "#{perspective}px"
      return @

  # getBackgroundColor/setBackgroundColor?
