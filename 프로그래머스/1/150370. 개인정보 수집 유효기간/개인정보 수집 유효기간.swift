import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer = [Int]()
    var termsDict = [String: Int]()

    let todaySplit = today.split(separator:".").map{ Int($0)! }
    let todayYear = todaySplit[0]
    let todayMonth = todaySplit[1]
    let todayDay = todaySplit[2]

    // terms를 딕셔너리로 변환
    for term in terms {
        let termSplit = term.split(separator:" ").map{ String($0) }
        let termName = termSplit[0]
        let termPeriod = Int(termSplit[1])!
        
        termsDict[termName] = termPeriod
    }
    
    for (i, privacy) in privacies.enumerated() {
        let privacySplit = privacy.split(separator:" ").map{ String($0) }
        
        let privacyDateString = privacySplit[0]
        let privacyTerm = privacySplit[1]
        
        let privacyDateSplit = privacyDateString.split(separator:".").map{ Int($0)! }
        
        var year = privacyDateSplit[0]
        var month = privacyDateSplit[1]
        var day = privacyDateSplit[2]
        
        month += termsDict[privacyTerm]!
        
        year += (month - 1) / 12
        month = (month - 1) % 12 + 1
        
        
        // 만료여부 파악
        if year < todayYear {
            answer.append(i + 1)
        } else if year == todayYear && month < todayMonth {
            answer.append(i + 1)
        } else if year == todayYear && month == todayMonth && day <= todayDay {
            answer.append(i + 1)
        }
    }
    
    return answer
}