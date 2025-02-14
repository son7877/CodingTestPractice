import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    // n: 택배 상자 개수
    // w: 가로로 놓는 상자의 개수
    // num: 꺼내려는 택배 상자의 번호
    
    var arr = [[Int]]()
    let height = Int(ceil(Double(n) / Double(w))) // 배열의 높이
    var current = 1
    var numRow = 0
    var numCol = 0
    
    for i in 0..<height {
        var row = [Int]()
        for j in 0..<w {
            if current > n { // n을 초과하는 경우 종료
                row.append(0)
                continue
            }
            if current == num { // 꺼내려는 상자의 번호가 있는 줄
                numRow = i
                numCol = j
            }
            row.append(current)
            current += 1
        }
        
        if i % 2 == 1 { // 홀수 번째 줄은 뒤집기
            row.reverse()
        }
        
        arr.append(row)
    }
    
    if numRow % 2 == 1 { // 홀수 번째 줄은 뒤집기
        numCol = w - 1 - numCol
    }

    var answer = 0
    
    // 해당 번호의 상자 위 줄에 열 번호가 같은 상자가 몇 개 있는지 구하기
    // 맨 위줄의 번호가 0인 경우는 박스가 없음
    
    for i in numRow..<arr.count {
        if arr[i][numCol] != 0 {
            answer += 1
        }
    }
    
    return answer
}
