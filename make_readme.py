import os
from urllib import parse

HEADER="""
#
# 백준, 프로그래머스 문제 풀이 목록
"""

def main():
  content = ""
  content += HEADER
  
  directories = []
  solveds = []
  
  for root, dirs, files in os.walk("."):
    dirs.sort()
    if root == '.':
      for dir in ('.git', '.github'):
        try:
          dirs.remove(dir)
        except ValueError:
          pass
      continue
    
    category = os.path.basename(root)
    
    if category == 'images':
      continue
      
    directory = os.path.basename(os.path.dirname(root))
    
    if directory == '.':
      continue
    
    # 백준과 프로그래머스 폴더에 있는 풀이만 처리
    if directory not in ["백준", "프로그래머스"]:
      continue
      
    if directory not in directories:
      content += "## 📚 {}\n".format(directory)
      directories.append(directory)
      
    for file in files:
      if category not in solveds:
        content += "|{}|[링크]({})|\n".format(category, parse.quote(os.path.join(root, file)))
        solveds.append(category)
        
  with open("README.md", "w") as fd:
    fd.write(content)
    
if __name__ == "__main__":
  main()