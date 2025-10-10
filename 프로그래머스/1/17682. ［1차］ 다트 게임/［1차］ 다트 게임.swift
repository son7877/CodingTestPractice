func solution(_ dartResult:String) -> Int {
    var scores: [Int] = []
    var scoreString = ""
    
    for char in dartResult {
        if char.isNumber {
            scoreString.append(char)
        } else if char == "S" || char == "D" || char == "T" {
            let score = Int(scoreString)!
            
            var calculatedScore = 0
            if char == "S" {
                calculatedScore = score
            } else if char == "D" {
                calculatedScore = score * score
            } else if char == "T" {
                calculatedScore = score * score * score
            }
            
            scores.append(calculatedScore)
            scoreString = ""
        } else if char == "*" { // 직전 점수 2배
            scores[scores.count - 1] *= 2
            if scores.count > 1 {
                scores[scores.count - 2] *= 2
            }
        } else if char == "#" { // 해당 점수 마이너스
            scores[scores.count - 1] *= -1
        }
    }
    
    return scores.reduce(0, +)
}