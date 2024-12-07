import Foundation

func solution(_ diffs: [Int], _ times: [Int], _ limit: Int64) -> Int {
    // 퍼즐을 해결 가능한지 확인하는 함수
    func canSolveAllPuzzles(level: Int) -> Bool {
        var totalTime: Int64 = 0
        var prevTime: Int64 = 0
        
        for i in 0..<diffs.count {
            let diff = diffs[i]
            let time = Int64(times[i])
            
            if level >= diff {
                // 숙련도가 충분하면 해당 퍼즐만 해결
                totalTime += time
            } else {
                // 숙련도가 부족하면 추가 시간이 발생
                let mistakes = Int64(diff - level)
                totalTime += (mistakes * (prevTime + time)) + time
            }
            
            // 제한 시간을 초과하면 false 반환
            if totalTime > limit {
                return false
            }
            
            prevTime = time
        }
        
        return true
    }
    
    // 이분 탐색으로 최소 숙련도 찾기
    var left = 1
    var right = 100_000 // 최대 난이도 범위
    var answer = right
    
    while left <= right {
        let mid = (left + right) / 2
        
        if canSolveAllPuzzles(level: mid) {
            // 현재 숙련도로 제한 시간 내 해결 가능 -> 더 낮은 숙련도를 시도
            answer = mid
            right = mid - 1
        } else {
            // 현재 숙련도로는 불가능 -> 더 높은 숙련도를 시도
            left = mid + 1
        }
    }
    
    return answer
}
