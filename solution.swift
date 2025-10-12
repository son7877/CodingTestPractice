import Foundation

func solution(_ board: [[Int]], _ commands: [[Int]]) -> [[Int]] {
    var answer = board
    let rowCount = board.count
    let colCount = board[0].count
    
    // 방향: 1=오른쪽, 2=아래, 3=왼쪽, 4=위
    let dr = [0, 0, 1, 0, -1]  // row delta (index 0 unused, 1=right, 2=down, 3=left, 4=up)
    let dc = [0, 1, 0, -1, 0]  // col delta
    
    for command in commands {
        let appId = command[0]
        let direction = command[1]
        
        // 앱의 모든 위치를 찾기
        var appPositions: [(Int, Int)] = []
        for r in 0..<rowCount {
            for c in 0..<colCount {
                if answer[r][c] == appId {
                    appPositions.append((r, c))
                }
            }
        }
        
        if appPositions.isEmpty { continue }
        
        // 앱을 이동시키는 함수
        moveApp(appId: appId, direction: direction, board: &answer, rowCount: rowCount, colCount: colCount, dr: dr, dc: dc)
    }
    
    return answer
}

func moveApp(appId: Int, direction: Int, board: inout [[Int]], rowCount: Int, colCount: Int, dr: [Int], dc: [Int]) {
    // 현재 앱의 모든 위치 찾기
    var currentPositions: [(Int, Int)] = []
    for r in 0..<rowCount {
        for c in 0..<colCount {
            if board[r][c] == appId {
                currentPositions.append((r, c))
            }
        }
    }
    
    if currentPositions.isEmpty { return }
    
    // 새로운 위치 계산 (wrap around)
    var newPositions: [(Int, Int)] = []
    for (r, c) in currentPositions {
        let newR = (r + dr[direction] + rowCount) % rowCount
        let newC = (c + dc[direction] + colCount) % colCount
        newPositions.append((newR, newC))
    }
    
    // 새 위치에 다른 앱이 있는지 확인 (자기 자신 제외)
    var blockedApps = Set<Int>()
    for (newR, newC) in newPositions {
        let cellValue = board[newR][newC]
        if cellValue != 0 && cellValue != appId {
            blockedApps.insert(cellValue)
        }
    }
    
    // 충돌하는 앱들을 먼저 이동
    for blockedAppId in blockedApps {
        moveApp(appId: blockedAppId, direction: direction, board: &board, rowCount: rowCount, colCount: colCount, dr: dr, dc: dc)
    }
    
    // 현재 위치를 0으로 클리어
    for (r, c) in currentPositions {
        board[r][c] = 0
    }
    
    // 새 위치에 앱 배치
    for (newR, newC) in newPositions {
        board[newR][newC] = appId
    }
}

// 테스트
let test1Board = [[0, 2, 2, 0, 0, 0, 0, 0], [0, 2, 2, 0, 0, 4, 4, 0], [0, 3, 3, 3, 1, 4, 4, 0], [0, 3, 3, 3, 0, 0, 0, 0], [0, 3, 3, 3, 5, 5, 6, 0], [0, 0, 0, 0, 5, 5, 0, 0]]
let test1Commands = [[3, 1], [3, 1]]
let test1Result = solution(test1Board, test1Commands)
print("Test 1:")
for row in test1Result {
    print(row)
}
print("\nExpected:")
print("[[0, 0, 2, 2, 0, 0, 0, 0], [4, 4, 2, 2, 0, 0, 0, 0], [4, 4, 0, 3, 3, 3, 1, 0], [0, 0, 0, 3, 3, 3, 0, 0], [6, 0, 0, 3, 3, 3, 5, 5], [0, 0, 0, 0, 0, 0, 5, 5]]")

print("\n---\n")

let test2Board = [[0, 9, 1, 1, 6, 0, 0, 0], [2, 2, 1, 1, 0, 0, 0, 0], [2, 2, 3, 4, 4, 4, 0, 0], [5, 0, 0, 4, 4, 4, 7, 0], [0, 0, 0, 4, 4, 4, 8, 8], [0, 0, 0, 0, 0, 0, 8, 8]]
let test2Commands = [[2, 1], [3, 1], [9, 2], [4, 1]]
let test2Result = solution(test2Board, test2Commands)
print("Test 2:")
for row in test2Result {
    print(row)
}
print("\nExpected:")
print("[[8, 8, 0, 1, 1, 6, 0, 0], [8, 8, 0, 1, 1, 0, 0, 0], [4, 4, 4, 9, 3, 0, 0, 0], [4, 4, 4, 7, 2, 2, 0, 0], [4, 4, 4, 0, 2, 2, 0, 0], [0, 5, 0, 0, 0, 0, 0, 0]]")

print("\n---\n")

let test3Board = [[1, 1, 0], [1, 1, 0]]
let test3Commands = [[1, 4], [1, 3], [1, 2]]
let test3Result = solution(test3Board, test3Commands)
print("Test 3:")
for row in test3Result {
    print(row)
}
print("\nExpected:")
print("[[0, 1, 1], [0, 1, 1]]")
