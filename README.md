jQuery-EffectQueue
==================

Run jQuery effects in sequence.

The following lines show how to use it (coffee-script):

    # Create a queue.
    queue = new EffectQueue()

    # Add three effects to execute in sequence.
    queue.enqueue( -> $( "#target1" ).effect1() )
    queue.enqueue( -> $( "#target2" ).effect2() )
    queue.enqueue( -> $( "#target3" ).effect3() )
    # Next three effects are executed in parallel.
    queue.enqueue( [
      -> $( "#target3" ).effect4(),
      -> $( "#target2" ).effect5(),
      -> $( "#target1" ).effect6()
    ] )
    # Next target gets removed after effect was executed.
    # Important: Use detach() instead of remove()!
    queue.enqueue( -> $( "#target4" ).effect7(
        "slow",
        -> $( this ).detach()
    ) )
    # Add two more effects to execute in sequence.
    queue.enqueue( -> $( "#target4" ).effect8() )
    queue.enqueue( -> $( "#target5" ).effect9() )

    # Flush the queue and alert when all effects were executed.
    queue.flush().then( -> alert "Over!" )

    # You can reuse the queue. Just add effects and flush ...


Notes:

* The EffectQueue uses `$.when()` (http://api.jquery.com/jQuery.when/).
* You can add "Deferred objects, or plain JavaScript objects".
* jQuery effects should work by default.
* Don't use `remove()` as callback for effects, use `detach()` instead!
