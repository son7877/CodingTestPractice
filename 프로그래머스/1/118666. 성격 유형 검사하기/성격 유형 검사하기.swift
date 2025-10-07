import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var scoreDict: [String: Int] = [
        "R": 0, "T": 0,
        "C": 0, "F": 0,
        "J": 0, "M": 0,
        "A": 0, "N": 0
    ]
    
    // 성격 유형 검사 과정(점수)
    for (i, question) in survey.enumerated() {
        let score = 4 - choices[i]
        let questionSplit = question.map {String($0)}
        
        if score < 0 {
            scoreDict[questionSplit[1], default: 0] -= score
        } else {
            scoreDict[questionSplit[0], default: 0] += score
        }
    }
    

    let pairs = [("R", "T"), ("C", "F"), ("J", "M"), ("A", "N")]

    var answer = ""
    
    // 더 높은 유형 찾기
    for (char1, char2) in pairs {
        let score1 = scoreDict[char1] ?? 0
        let score2 = scoreDict[char2] ?? 0
    
        if score2 > score1 {
            answer.append(char2)
        } else {
            answer.append(char1)
        }
    }

    return answer
}