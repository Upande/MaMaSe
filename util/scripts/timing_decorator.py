
'''
This decorator shall be used to get exection time of functions on the environmet.
For more info on decorators, check out https://pythonconquerstheuniverse.wordpress.com/2012/04/29/python-decorators/
'''

import time

def time_usage(func):
    def wrapper(*args, **kwargs):
        beg_ts = time.time()
        result = func(*args, **kwargs)
        end_ts = time.time()
        print '\n %r (%r, %r) elaspsed time : %5.4f sec \n\n' % (func.__name__, args, kwargs, end_ts - beg_ts)
#        print("elapsed time: %f" % (end_ts - beg_ts))
        return result
    return wrapper

@time_usage
def test():
    for i in xrange(0, 10000):
        pass

if __name__ == "__main__":
    test() 
