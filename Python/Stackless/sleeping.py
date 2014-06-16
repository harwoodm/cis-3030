
import stackless
import time

def do_sleep():
    wakeup = time.time() + 1.0
    while time.time() < wakeup:
        stackless.schedule()
        
def do_task():
    while 1:
        do_sleep()
        print "Hello"
        
stackless.tasklet(do_task)()
stackless.run()


