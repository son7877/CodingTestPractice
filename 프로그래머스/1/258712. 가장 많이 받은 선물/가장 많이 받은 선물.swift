import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    // ex. ["a": 0, "b": 1, "c": 2] 이렇게 넣기
    var indexDict = [String: Int] ()

    for (index, element) in friends.enumerated() {
        indexDict[element] = index
    }
    
    // 선물 지수 딕셔너리 생성 
    var giftDict = [String: Int] ()
    for friend in friends {
        giftDict[friend] = 0
    }
    
    // friends.count * friends.count 크기의 2차원 배열 생성
    var giftArr = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    
    // ["a b", "b a", "c a", "a c", "a c", "c a"] 에서
    // "a b" -> indexDict를 활용해서 (0, 1)로 변환 후 giftArr에서 (0, 1)의 위치에 값 1 증가시키기
    // 선물 지수 증감 시키기
    
    for gift in gifts {
        let names = gift.split(separator: " ").map { String($0) }
        let giver = names[0]
        let receiver = names[1]
        
        if let giverIndex = indexDict[giver], let receiverIndex = indexDict[receiver] {
            giftArr[giverIndex][receiverIndex] += 1
        }
        
        giftDict[giver]? += 1
        giftDict[receiver]? -= 1
    }
    
    // 다음 달에 가장 많은 선물을 받는 사람이 받은 선물 개수 구하기
    // 1. 서로 주고 받은 선물 개수 비교 후 많이 준 사람 1++
    // 2. 선물을 주고 받은 수가 같을 때(서로 0일때에도) 선물 지수 높은 사람 1++
    // 3. 선물 지수도 같으면 continue
    // 4. 가장 값이 높은 사람의 값 출력하기
    
    var nextMonthGifts = Array(repeating: 0, count: friends.count)
    
    for i in 0..<friends.count {
        for j in (i + 1)..<friends.count {
            let i_to_j = giftArr[i][j]
            let j_to_i = giftArr[j][i]
            
            // 먼저 주고 받은 선물 개수 비교
            if i_to_j > j_to_i {
                nextMonthGifts[i] += 1
            } else if j_to_i > i_to_j {
                nextMonthGifts[j] += 1
            } else {    
                // 선물 지수 비교
                let iGiftIndex = giftDict[friends[i]]!
                let jGiftIndex = giftDict[friends[j]]!
                
                if iGiftIndex > jGiftIndex {
                    nextMonthGifts[i] += 1
                } else if jGiftIndex > iGiftIndex {
                    nextMonthGifts[j] += 1
                }
            }
        }
    }
    
    var result = nextMonthGifts.max() ?? 0
    
    return result
}