import Foundation

func solution(_ players: [Int], _ m: Int, _ k: Int) -> Int {
    var servers = Array(repeating: 0, count: 24) // 0~23시 까지의 서버 개수
    var answer = 0

    for (sTime, playerCnt) in players.enumerated() { // 시간대 별로 처리
        // sTime: 시간대, playerCnt: 이용자 수
        
        if playerCnt / m > servers[sTime] {
            
            // needServerCnt: 추가로 필요한 서버 개수
            let needServerCnt = playerCnt / m - servers[sTime]

            for i in 0..<k {
                if sTime + i <= 23 {
                    servers[sTime + i] += needServerCnt
                }
            }
            answer += needServerCnt
        }
    }

    return answer
}

