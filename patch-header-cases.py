# 2025 - dsalzner/CnC_Generals_Zero_Hour-Linux
# ---

import fnmatch
import glob
import os

def listOfHeaders():
    matches = []
    for root, dirnames, filenames in os.walk("."):
        for filename in filenames:
            if filename.endswith(('.h')):
                matches.append(os.path.join(root, filename))
    return matches

def myBasename(path):
    return path.split("/")[-1]

with open('missing-headers.txt') as f:
   for line in f:
       code,include = line.strip().split(";")

       result = ""
       a = myBasename(include)
       b = ""
       for f in listOfHeaders():
            t = myBasename(f)
            if a != t and a.lower() == t.lower():
                b = t
                break

       if b != "":
            print(f"in {code} replace {a} with {b}")

            try:
                with open(code, 'r') as fp:
                  contents = fp.read()

                contents = contents.replace(a, b)

                with open(code, 'w') as fp:
                  fp.write(contents)

            except Exception as e: 
                print(f'[E] {code} {e}')
