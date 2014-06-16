
import threading

def count(n):
    while n > 0:
        n -= 1

#count(100000000)
#count(100000000)

t1 = threading.Thread(target=count, args=(100000000, ))
t1.start()
t2 = threading.Thread(target=count, args=(100000000, ))
t2.start()

t1.join()
t2.join()

# Because of the GIL, the multi-threaded version actually performs much more poorly than the
# single threaded version... especially on a multi-core processor.
#
# See: http://www.dabeaz.com/python/GIL.pdf
