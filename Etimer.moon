

Timer = assert require 'timer'


-- Enabling the usage of tags
class Etimer

  new: =>
    @timer = Timer!
    @tags

  update: (dt) =>
    -- Update the Timer
    if @timer then @timer\update dt

  after: (tag, dur, f) =>
    if type(tag) == 'string'
      @cancel tag
      @tags[tag] = @timer\after dur, f
      return @tags[tag]
    else
      return @timer\after tag, dur

  during: (tag, dur, f, after) =>
    if type(tag) == 'string'
      @cancel tag
      @tags[tag] = @timer\during dur, f, after
      return @tags[tag]
    else
      return @timer\during tag, dur, f

  tween: (tag, dur, tab, tweenTab, tweenFunc, after) =>
    if type(tag) == 'string'
      @cancel tag
      @tags[tag] = @timer\tween dur, tab, tweenTab, tweenFunc, after
      return @tags[tag]
    else
      return @timer\tween tag, dur, tab, tweenTab, tweenFunc


  every: (tag, dur, f, count) =>
    if type(tag) == 'string'
      @cancel tag
      @tags[tag] = @timer\every dur, f, count
      return @tags[tag]
    else
      return @timer\every tag, dur, f

  cancel: (tag) =>
    if tag
      if @tags[tag]
        @timer\cancel @tags[tag]
        @tags[tag] = nil
      else
        @timer\cancel tag

  clear: =>
    @timer\clear!
    @tags = {}

  destroy: =>
    @timer\clear!
    @tags = {}
    @timer = nil
