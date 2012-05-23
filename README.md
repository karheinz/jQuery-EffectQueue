jQuery-EffectQueue
==================

Run jQuery effects in sequence.

The following lines show how to use it (coffee-script):

    queue = new EffectQueue()
    # Add three effects to execute in sequence.
    queue.enqueue( -> effect1() )
    queue.enqueue( -> effect2() )
    queue.enqueue( -> effect3() )
    # Next three effects are executed in parallel.
    queue.enqueue( [
      -> effect4(),
      -> effect5(),
      -> effect6()
    ] )
    # Add three more effects to execute in sequence.
    queue.enqueue( -> effect7() )
    queue.enqueue( -> effect8() )
    queue.enqueue( -> effect9() )

    # Flush the queue and alert when all effects were executed.
    queue.flush().then( -> alert "Over!" )

    # You can reuse the queue. Just add effects and flush ...


Notes:

* The EffectQueue uses `$.when()` (http://api.jquery.com/jQuery.when/).
* You can add "Deferred objects, or plain JavaScript objects".
* jQuery effects work by default.
* Don't use `remove()` as callback for effects, use `detach()` instead!
