import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    // location의 인덱스에 존재하는 프로세스가 몇 번째로 출력되는지 반환
    var answer = 0
    var priorities = priorities
    var location = location
    var index = 0
    
    while !priorities.isEmpty {
        let max = priorities.max()!
        
        if priorities[0] == max {
            priorities.removeFirst()
            index += 1
            
            if location == 0 {
                answer = index
                break
            }
        } else {
            let first = priorities.removeFirst()
            priorities.append(first)
        }
        
        location -= 1
        if location == -1 {
            location = priorities.count - 1
        }
    }
    
    return answer
}