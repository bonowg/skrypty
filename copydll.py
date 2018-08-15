import os
import shutil
import time

file = 'libka.dll'
path = os.path.dirname(os.getcwd())

with open(os.path.join(os.getcwd(), 'proc.pid'), 'w') as f:
    f.write(str(os.getpid()))
    f.close()

while True:
    dirs = [os.path.join(path, dir) for dir in next(os.walk(path))[1]]
    for item in dirs:
        result = os.path.isfile(os.path.join(item, file))
        print "Checking path: {0} - {1}".format(item, result)
        if not result:
            print "Copying"
            shutil.copyfile(os.path.join(os.getcwd(), file), os.path.join(item, file))
    time.sleep(1)