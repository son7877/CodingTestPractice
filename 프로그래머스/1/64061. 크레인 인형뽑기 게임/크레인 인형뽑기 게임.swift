import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    var gameBoard = board
    var basket: [Int] = []
    
    for move in moves {
        let columnIndex = move - 1
        
        for rowIndex in 0..<gameBoard.count {
            let doll = gameBoard[rowIndex][columnIndex]
            
            if doll != 0 { // 해당 위치가 비어있지 않은 경우(인형이 있을 때)
                if basket.last == doll {
                    basket.popLast()
                    answer += 2
                } else {
                    basket.append(doll)
                }
                
                gameBoard[rowIndex][columnIndex] = 0
                
                break
            }
        }
    }
    
    return answer
}