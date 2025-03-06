# 2025 - dsalzner/CnC_Generals_Zero_Hour-Linux
# ---

import glob
import os

def listOfHeaders():
  import fnmatch
  import os
  matches = []
  for root, dirnames, filenames in os.walk("."):
      for filename in filenames:
          if filename.endswith(('.h')):
              matches.append(os.path.join(root, filename))
  return matches

def myBasename(path):
    return path.split("/")[-1]

def findEnumDefinition(enumName):
    for headerFile in listOfHeaders():
        with open(headerFile, 'r') as fp:
          contents = ""
          try:
              for line in fp:
                  if f'enum {enumName}' in line and not ";" in line:
                      return headerFile
          except:
              #print(f'[E] {headerFile}')
              pass
    return ""

assert findEnumDefinition("NameKeyType") == "./Generals/Code/GameEngine/Include/Common/NameKeyGenerator.h"

with open('undeclared-enum.txt') as f:
    for line in f:
        try:
            # example line:
            #  ./Generals/Code/GameEngine/Include/Common/STLTypedefs.h:67:6: error: use of enum ‘NameKeyType’ without previous declaration
            sourceFile = line.strip().split(":")[0]
            enumName = line.strip().split(":")[4].replace(" use of enum ‘", "").replace("’ without previous declaration", "")
            definitionFile = findEnumDefinition(enumName)
            print(f'undeclared {enumName} in {sourceFile}, manually fix by including {definitionFile}')
        except:
            print(f'[E] {line}')
