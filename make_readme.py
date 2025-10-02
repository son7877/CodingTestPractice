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
                if len(parts) < 4:  # 경로가 충분히 깊지 않으면 건너뜀
                    continue

                difficulty = parts[2]
                
                # 수정: '.'을 기준으로 한 번만 분리하여 번호와 이름을 나눔
                problem_info = parts[3].split('.', 1)
                if len(problem_info) != 2: # '번호. 이름' 형식이 아니면 건너뜀
                    continue

                problem_num_str = problem_info[0].strip()
                problem_name = problem_info[1].lstrip(' ').strip() # 특수 공백 및 일반 공백 제거
                
                problem_num_int = int(problem_num_str) # 정수 변환으로 유효성 검사

                # 마크다운 테이블 행 생성 (상대 경로 및 웹 경로 형식으로 수정)
                relative_path = os.path.join(root, file).replace(os.sep, '/')
                line = f"| {difficulty} | {problem_num_str} | [{problem_name}](https://www.acmicpc.net/problem/{problem_num_str}) | [바로가기](./{relative_path}) |"
                
                # 정수 문제 번호와 함께 튜플로 저장 (정렬을 위해)
                baekjoon_list.append((problem_num_int, line))

            except (IndexError, ValueError):
                # 예상치 못한 폴더 구조나 변환 오류는 건너뜀
                continue

    # 문제 번호 (정수) 기준으로 정렬
    baekjoon_list.sort(key=lambda x: x[0])
    
    # 정렬된 리스트에서 마크다운 라인만 추출하여 반환
    return "\n".join([line for num, line in baekjoon_list])

# 프로그래머스 문제 목록 생성
def make_programmers_list():
    programmers_list = []
    for root, dirs, files in os.walk("./프로그래머스"):
        for file in files:
            if not file.endswith(('.java', '.swift', '.py', '.js', '.sql')):
                continue
            
            try:
                parts = root.split(os.sep)
                if len(parts) < 4:
                    continue

                level = f"Lv.{parts[2]}"
                
                # 수정: '.'을 기준으로 한 번만 분리
                problem_info = parts[3].split('.', 1)
                if len(problem_info) != 2:
                    continue

                problem_num = problem_info[0].strip()
                problem_name = problem_info[1].lstrip(' ').strip()
                
                relative_path = os.path.join(root, file).replace(os.sep, '/')
                line = f"| {level} | [{problem_name}](https://school.programmers.co.kr/learn/courses/30/lessons/{problem_num}) | [바로가기](./{relative_path}) |"
                programmers_list.append(line)
            except (IndexError, ValueError):
                continue
                
    programmers_list.sort()
    return "\n".join(programmers_list)


# 템플릿 파일을 읽고, 생성된 목록으로 README.md 파일 업데이트
def make_readme():
    try:
        with open("README_template.md", 'r', encoding='utf-8') as f:
            template = f.read()
    except FileNotFoundError:
        print("오류: README_template.md 파일을 찾을 수 없습니다. 파일을 생성해주세요.")
        return

    baekjoon_section = make_baekjoon_list()
    programmers_section = make_programmers_list()

    # 템플릿의 위치 지정자를 실제 목록으로 교체
    readme = template.replace("{{BAEKJOON}}", baekjoon_section)
    readme = readme.replace("{{PROGRAMMERS}}", programmers_section)

    with open("README.md", 'w', encoding='utf-8') as f:
        f.write(readme)

# 스크립트 실행
if __name__ == "__main__":
    make_readme()
    print("README.md 생성이 완료되었습니다!")
