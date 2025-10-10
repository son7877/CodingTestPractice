import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var dict: [Int: Double] = [:] // 스테이지의 실패율을 저장하는 딕셔너리
    var n = stages.count
    
    var playersDict: [Int: Int] = [:]
    for stage in stages {
        playersDict[stage, default: 0] += 1
    }
    
    for stage in 1...N {
        let count = playersDict[stage] ?? 0       
        
        // 실패율 계산 및 딕셔너리에 저장
        if n == 0 {
            dict[stage] = 0.0
        } else {
            dict[stage] = Double(count) / Double(n)
        }
                
        n -= count
    }
    
    // 실패율이 높은 순으로 정렬해서 스테이지만 뽑아내기
    let sortedDict = dict.sorted { item1, item2 in
        if item1.value > item2.value {
            return true 
        } else if item1.value == item2.value {
            if item1.key < item2.key {
                return true 
            }
        }

        return false
    }
    
    let answer = sortedDict.map { $0.key }
    
    return answer
}