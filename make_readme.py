import os

# 백준 문제 목록 생성
def make_baekjoon_list():
    baekjoon_list = []
    # ./백준 폴더를 기준으로 탐색
    for root, dirs, files in os.walk("./백준"):
        # 각 문제 폴더에 있는 소스 코드 파일만 처리
        for file in files:
            if not file.endswith(('.java', '.swift', '.py', '.js')):
                continue

            try:
                # 폴더 경로에서 정보 추출 (e.g., ./백준/Bronze/1000. A+B)
                parts = root.split(os.sep)
                difficulty = parts[2]
                problem_info = parts[3].split('. ')
                problem_num = problem_info[0]
                problem_name = '. '.join(problem_info[1:])
                
                # 마크다운 테이블 행 생성
                # 문제 이름에 문제 링크 걸기, 풀이 파일에 링크 걸기
                line = f"| {difficulty} | {problem_num} | [{problem_name}](https://www.acmicpc.net/problem/{problem_num}) | [바로가기]({os.path.join(root, file)}) |"
                baekjoon_list.append(line)
            except IndexError:
                # 예상치 못한 폴더 구조는 건너뜀
                continue

    # 문제 번호 순으로 정렬
    baekjoon_list.sort(key=lambda x: int(x.split('|')[2].strip()))
    return "\n".join(baekjoon_list)

# 프로그래머스 문제 목록 생성 (백준과 유사)
def make_programmers_list():
    programmers_list = []
    for root, dirs, files in os.walk("./프로그래머스"):
        for file in files:
            if not file.endswith(('.java', '.swift', '.py', '.js', '.sql')):
                continue
            
            try:
                parts = root.split(os.sep)
                level = f"Lv.{parts[2]}" # 0, 1, 2... -> Lv.0, Lv.1
                problem_info = parts[3].split('. ')
                problem_num = problem_info[0]
                problem_name = '. '.join(problem_info[1:])
                
                line = f"| {level} | [{problem_name}](https://school.programmers.co.kr/learn/courses/30/lessons/{problem_num}) | [바로가기]({os.path.join(root, file)}) |"
                programmers_list.append(line)
            except IndexError:
                continue
                
    programmers_list.sort()
    return "\n".join(programmers_list)


# 템플릿 파일을 읽고, 생성된 목록으로 README.md 파일 업데이트
def make_readme():
    with open("README_template.md", 'r', encoding='utf-8') as f:
        template = f.read()

    baekjoon_section = make_baekjoon_list()
    programmers_section = make_programmers_list()

    # 템플릿의 위치 지정자를 실제 목록으로 교체
    readme = template.replace("", baekjoon_section)
    readme = readme.replace("", programmers_section)

    with open("README.md", 'w', encoding='utf-8') as f:
        f.write(readme)

# 스크립트 실행
if __name__ == "__main__":
    make_readme()
    print("README.md 생성이 완료되었습니다!")
