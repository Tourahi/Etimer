

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




  cancel: (tag) =>
    if tag
      if @tags[tag]
        @timer\cancel @tags[tag]
        @tags[tag] = nil
      else
        @timer\cancel tag

