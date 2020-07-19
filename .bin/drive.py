import os
import sys


def search():
    if len(sys.argv) == 1:
        return os.system("$BROWSER https://drive.google.com/drive/")

    elif len(sys.argv) == 2:
        target = sys.argv[1] 
    
    else:
        target = []
        for arg in sys.argv[1::]:
            target.append(str(arg) + '%20')

        target[-1] = target[-1].replace("%20", "")
        target = ''.join(target)
    
    os.system("$BROWSER https://drive.google.com/drive/search?q="+ target)

search()
