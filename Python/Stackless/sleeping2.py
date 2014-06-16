
import signal
import stackless
import time

sleep_channel = stackless.channel()

def alarm_handler(signal_number, frame):
    print "Inside SIGALRM handler"
    sleep_channel.send(None)

def do_sleep():
    signal.alarm(1)
    sleep_channel.receive()
        
def do_task():
    while 1:
        do_sleep()
        print "Hello"

signal.signal(signal.SIGALRM, alarm_handler)
stackless.tasklet(do_task)()
stackless.run()

