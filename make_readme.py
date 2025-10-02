import os
from urllib import parse

HEADER="""# 백준, 프로그래머스 문제 풀이 목록

[![Solved.ac Profile](http://mazassumnida.wtf/api/v2/generate_badge?boj=YOUR_BOJ_ID)](https://solved.ac/YOUR_BOJ_ID/)


## 📊 통계
"""

def count_problems_by_platform():
    """플랫폼별 문제 수를 세는 함수"""
    baekjoon_count = 0
    programmers_count = 0
    
    for root, dirs, files in os.walk("."):
        directory = os.path.basename(os.path.dirname(root))
        if directory == "백준" and files:
            baekjoon_count += 1
        elif directory == "프로그래머스" and files:
            programmers_count += 1
    
    return baekjoon_count, programmers_count

def main():
    content = ""
    content += HEADER
    
    # 통계 섹션 추가
    baekjoon_count, programmers_count = count_problems_by_platform()
    content += f"- 백준: **{baekjoon_count}문제**\n"
    content += f"- 프로그래머스: **{programmers_count}문제**\n"
    content += f"- 총합: **{baekjoon_count + programmers_count}문제**\n\n"
    
    directories = []
    solveds = []
    platform_problems = {"백준": [], "프로그래머스": []}
    
    # 백준과 프로그래머스 폴더만 처리
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
        directory = os.path.basename(os.path.dirname(root))
        
        # 백준과 프로그래머스 폴더만 처리
        if directory not in ["백준", "프로그래머스"]:
            continue
            
        if category == 'images':
            continue
        
        if directory not in directories:
            directories.append(directory)
            
        for file in files:
            if category not in solveds:
                file_path = parse.quote(os.path.join(root, file))
                platform_problems[directory].append({
                    "category": category,
                    "path": file_path
                })
                solveds.append(category)
    
    # 플랫폼별로 정리해서 출력
    for platform in ["백준", "프로그래머스"]:
        if platform_problems[platform]:
            content += f"## 📚 {platform}\n\n"
            
            # 접기/펼치기 기능을 위한 details 태그 사용
            content += "<details>\n"
            content += f"<summary><strong>📋 {platform} 문제 목록 ({len(platform_problems[platform])}문제)</strong></summary>\n\n"
            content += "| 문제번호 | 링크 |\n"
            content += "| :-----: | :---: |\n"
            
            # 문제 번호 기준으로 정렬 (숫자 우선, 그 다음 문자)
            sorted_problems = sorted(platform_problems[platform], 
                                   key=lambda x: (x["category"].isdigit() and int(x["category"]) or float('inf'), x["category"]))
            
            for problem in sorted_problems:
                content += f"|{problem['category']}|[📝 풀이보기]({problem['path']})|\n"
            
            content += "\n</details>\n\n"
    
    # 푸터 추가
    content += "---\n\n"
    content += "### 🔥 최근 활동\n"
    content += "꾸준히 문제를 풀며 실력을 쌓아가고 있습니다!\n\n"
    content += "### 📝 메모\n"
    content += "- 각 문제마다 상세한 주석과 설명을 포함하여 작성했습니다.\n"
    content += "- 효율적인 알고리즘과 최적화된 코드를 지향합니다.\n"
    content += "- 문제 해결 과정에서 배운 점들을 기록하고 있습니다.\n\n"
    
    with open("README.md", "w", encoding="utf-8") as fd:
        fd.write(content)
    
    print(f"README.md 생성 완료!")
    print(f"백준: {baekjoon_count}문제, 프로그래머스: {programmers_count}문제")
    
if __name__ == "__main__":
    main()
