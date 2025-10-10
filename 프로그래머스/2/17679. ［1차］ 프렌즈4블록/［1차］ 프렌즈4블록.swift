func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    var gameBoard = board.map{ Array($0) }
    
    while true {
        // 지워지는 블록
        var removed: Set<[Int]> = []
        
        for row in 0..<m-1 {
            for col in 0..<n-1 {
                let currentBlock = gameBoard[row][col]
                
                if currentBlock == " " {continue}
                    
                
                // 2x2 블록이 같은 모양인지 확인
                if currentBlock == gameBoard[row + 1][col] &&
                   currentBlock == gameBoard[row][col + 1] &&
                   currentBlock == gameBoard[row + 1][col + 1] {
                    // 사라질 블록들의 좌표를 Set에 추가 (중복 방지)
                    removed.insert([row, col])
                    removed.insert([row + 1, col])
                    removed.insert([row, col + 1])
                    removed.insert([row + 1, col + 1])
                }
            }
        }
        
        if removed.isEmpty {break}
            
        
        answer += removed.count
        for block in removed {
            gameBoard[block[0]][block[1]] = " " // 빈 블록으로 변경
        }
        
        // 제거 후 남은 블록 아래로 내리기
        for col in 0..<n {
            var emptyRow = m - 1
            for row in (0..<m).reversed() {
                if gameBoard[row][col] != " " {
                    // swap
                    let temp = gameBoard[row][col]
                    gameBoard[row][col] = " "
                    gameBoard[emptyRow][col] = temp
                    
                    emptyRow -= 1
                }
            }
        }
    }
    
    
    return answer
}