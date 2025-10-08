import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // 메일 받은 횟수 딕셔너리
    var mailCountDict: [String: Int] = [:]
    
    for id in id_list {
        mailCountDict[id] = 0
    }
    
    // 신고 당한 횟수 딕셔너리
    var reportedInfo: [String: Set<String>] = [:]
    
    let reportSet = Set(report) // 중복 신고 방지
    
    for user in reportSet {
        let id = user.split(separator: " ").map{String($0)}
        
        let reporter = id[0]
        let reported = id[1]
        
        reportedInfo[reported, default: Set<String>() ].insert(reporter)
    }
    
    // 신고 메일 보내는 횟수 구하기
    for (_, reporters) in reportedInfo {
        if reporters.count >= k {
            for reporter in reporters {
                mailCountDict[reporter, default: 0] += 1
            }
        }
    }
    
    let answer = id_list.map{ mailCountDict[$0]! }
    
    return answer
}