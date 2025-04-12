import Foundation

let num = Int(readLine()!)!

var words = [String]()
for _ in 0..<num {
    words.append(readLine()!)
}

let targetWord = words[0]

print(solution(words, targetWord))

func solution(_ words: [String], _ targetWord: String) -> Int {
    var count = 0
    for i in 1..<words.count {
        if isSimilar(words[i], targetWord) {
            count += 1
        }
    }
    return count
}

func isSimilar(_ word: String, _ targetWord: String) -> Bool {
    if abs(word.count - targetWord.count) > 1 {
        return false
    }

    var count = Array(repeating: 0, count: 26)
    
    for c in word {
        if let ascii = c.asciiValue {
            count[Int(ascii - Character("A").asciiValue!)] += 1
        }
    }

    for c in targetWord {
        if let ascii = c.asciiValue {
            count[Int(ascii - Character("A").asciiValue!)] -= 1
        }
    }

    var positiveCount = 0
    var negativeCount = 0

    for val in count {
        if val > 0 {
            positiveCount += val
        } else if val < 0 {
            negativeCount += -val
        }
    }

    if word.count == targetWord.count {
        return (positiveCount == 1 && negativeCount == 1) || (positiveCount == 0 && negativeCount == 0)
    } else {
        return positiveCount + negativeCount == 1
    }
}
