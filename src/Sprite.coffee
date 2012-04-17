DivSugar._Sprite =
  _initialize: (@id) ->
    @style.margin = '0px'
    @style.padding = '0px'
    @style.position = 'absolute'
    @style[DivSugar._transformStyle] = 'preserve-3d'
    @style[DivSugar._transformOrigin] = '0% 0% 0%'

    @_size = {}
    @_pos = {}
    @_rot = {}
    @_scl = {}
    @_imageClip = {}
    @_ps = @_rs = @_ss = ''

    @size 100, 100
    @position 0, 0, 0
    @rotation 0, 0, 0
    @scale 1, 1, 1
    @visible true
    @clip false
    @opacity 1
    @image null
    @imageClip 0, 0, 1, 1

    return @

  size: (w, h) ->
    switch arguments.length
      when 0
        return @_size

      when 1
        size = w
        @_size.w = size.w
        @_size.h = size.h

      else
        @_size.w = w
        @_size.h = h

    @style.width = "#{@_size.w}px"
    @style.height = "#{@_size.h}px"
    @imageClip @_imageClip
    return @

  position: (x, y, z) ->
    switch arguments.length
      when 0
        return @_pos

      when 1
        pos = x
        @_pos.x = pos.x
        @_pos.y = pos.y
        @_pos.z = pos.z

      else
        @_pos.x = x
        @_pos.y = y
        @_pos.z = z

    @_ps = "translate3d(#{@_pos.x}px, #{@_pos.y}px, #{@_pos.z}px) "
    @style[DivSugar._transform] = @_ps + @_rs + @_ss
    return @

  rotation: (x, y, z) ->
    switch arguments.length
      when 0
        return @_rot

      when 1
        rot = x
        @_rot.x = rot.x
        @_rot.y = rot.y
        @_rot.z = rot.z

      else
        @_rot.x = x
        @_rot.y = y
        @_rot.z = z

    @_rs = "rotateX(#{@_rot.x}deg) rotateY(#{@_rot.y}deg) rotateZ(#{@_rot.z}deg) "
    @style[DivSugar._transform] = @_ps + @_rs + @_ss
    return @

  scale: (x, y, z) ->
    switch arguments.length
      when 0
        return @_scl

      when 1
        scl = x
        @_scl.x = scl.x
        @_scl.y = scl.y
        @_scl.z = scl.z

      else
        @_scl.x = x
        @_scl.y = y
        @_scl.z = z

    @_ss = "scale3d(#{@_scl.x}, #{@_scl.y}, #{@_scl.z})"
    @style[DivSugar._transform] = @_ps + @_rs + @_ss
    return @

  visible: (visible) ->
    if arguments.length == 0
      return @_visible
    else
      @_visible = visible
      @style.visibility = if visible then "visible" else "hidden"
      return @

  clip: (clip) ->
    if arguments.length == 0
      return @_clip
    else
      @_clip = clip
      @style.overflow = if clip then "hidden" else "visible"
      return @

  opacity: (opacity) ->
    if arguments.length == 0
      return @_opacity
    else
      @_opacity = @style.opacity = opacity
      return @

  image: (imageUrlOrColor) ->
    if arguments.length == 0
      return @_image
    else
      @_image = imageUrlOrColor

      if not imageUrlOrColor?
        @style.backgroundColor = null
        @style.backgroundImage = null
      else if imageUrlOrColor.charAt(0) == '#'
        @style.backgroundColor = imageUrlOrColor
        @style.backgroundImage = null
      else
        @style.backgroundColor = null
        @style.backgroundImage = "url(#{imageUrlOrColor})"

      return @

  imageClip: (u1, v1, u2, v2) ->
    switch arguments.length
      when 0
        return @_imageClip

      when 1
        imageClip = u1
        @_imageClip.u1 = imageClip.u1
        @_imageClip.v1 = imageClip.v1
        @_imageClip.u2 = imageClip.u2
        @_imageClip.v2 = imageClip.v2

      else
        @_imageClip.u1 = u1
        @_imageClip.v1 = v1
        @_imageClip.u2 = u2
        @_imageClip.v2 = v2

    w = @_size.w / (@_imageClip.u2 - @_imageClip.u1)
    h = @_size.h / (@_imageClip.v2 - @_imageClip.v1)
    x = -@_imageClip.u1 * w
    y = -@_imageClip.v1 * h

    @style.backgroundPosition = "#{x}px #{y}px"
    @style.backgroundSize = "#{w}px #{h}px"

    return @
