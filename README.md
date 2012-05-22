jQuery-EffectQueue
==================

Run jQuery effects in sequence.

The following lines show how to use it (coffee-script):

    queue = new EffectQueue()
    queue.enqueue( -> effect1() )
    queue.enqueue( -> effect2() )
    queue.enqueue( -> effect3() )
    queue.enqueue( [ -> effect4(), -> effect5(), -> effect6() ] )   # parallel
    queue.enqueue( -> effect7() )
    queue.enqueue( -> effect8() )
    queue.enqueue( -> effect9() )

    # Flush the queue and alert when all effects were executed.
    queue.flush().then( -> alert "Over!" )


Notes:

* A queue can be reused.
* Don't use `remove()` as callback for effects, use `detach()` instead!
