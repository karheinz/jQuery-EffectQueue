root = exports ? this

class root.EffectQueue
  constructor: ( @jobs = [] ) ->
    @deferred = new $.Deferred()

  enqueue: ( job ) ->
    @jobs.push( job )
    
  flush: ->
    @deferred = new $.Deferred() if @deferred.isResolved()

    if @jobs.length == 0
      @deferred.resolve()
    else
      object = this
      if typeof( @jobs[ 0 ] ) is "function"
        job = @jobs.shift( 1 )
        $.when( job() ).then( -> object.flush() )
      else if @jobs[ 0 ] instanceof Array
        $.when( ( job() for job in @jobs.shift( 1 ) )... ).then( -> object.flush() )
      else
        @jobs.shift( 1 )
        @flush()

    return @deferred.promise()
