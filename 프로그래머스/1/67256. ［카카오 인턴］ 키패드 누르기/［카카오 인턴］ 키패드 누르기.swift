import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var touchHand: [String: [Int]] = [
        "left":[3,0], "right":[3,2]
    ]
    
    var num = 1
    var keypad = [Int: [Int]]()
    
    for i in 0..<3 {
        for j in 0..<3 {
            keypad[num, default: []] = [i,j]
            num += 1
        }
    }
    
    keypad[0] = [3, 1]
    
    
    for number in numbers {
        if number == 1 || number == 4 || number == 7 { 
            answer.append("L")
            touchHand["left"] = keypad[number]!
        } else if number == 3 || number == 6 || number == 9 {
            answer.append("R")
            touchHand["right"] = keypad[number]!
        } else { // 가운데 숫자
            let numberLocation = keypad[number]!
            let leftLocation = touchHand["left"]!
            let rightLocation = touchHand["right"]!
            
            let distanceLeft = abs(numberLocation[0] - leftLocation[0]) + abs(numberLocation[1] - leftLocation[1])
            let distanceRight = abs(numberLocation[0] - rightLocation[0]) + abs(numberLocation[1] - rightLocation[1])

            if distanceLeft < distanceRight {
                answer.append("L")
                touchHand["left"] = numberLocation
            } else if distanceLeft > distanceRight {
                answer.append("R")
                touchHand["right"] = numberLocation
            } else { // 거리가 동일할 때 -> 어느 손잡이 인지에 따라 따라감
                if hand == "right" {
                    answer.append("R")
                    touchHand["right"] = numberLocation
                } else {
                    answer.append("L")
                    touchHand["left"] = numberLocation
                }
            }
        }
    }
    
    return answer 
}