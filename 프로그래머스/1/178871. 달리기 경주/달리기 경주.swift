import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    // players -> 현재 등수 배열
    // callings -> 추월 시도에 성공한 선수
    // result -> 추월 후 최종 순위대로 나열
    
    var result = players
    var dict: [String:Int] = [:]
    
    for (index, player) in players.enumerated() {
        dict[player] = index
    }

    for i in callings {
        var index = dict[i]
        var foreRunner = result[index! - 1]
        
        result.swapAt(index!, index! - 1)
        
        dict[i] = dict[i]! - 1
        dict[foreRunner] = dict[foreRunner]! + 1
    }
    
    return result
}