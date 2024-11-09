import Foundation

let input = readLine()!
let bomb = readLine()!

func solution() {
    var stack = [Character]()
    let bombCount = bomb.count
    let bombArray = Array(bomb)
    
    for char in input {
        stack.append(char)
        
        // 스택의 마지막 부분이 폭탄 문자열과 일치하는지 확인
        if stack.count >= bombCount {
            if Array(stack[stack.count - bombCount..<stack.count]) == bombArray {
                // 폭탄 문자열만큼 스택에서 제거
                stack.removeLast(bombCount)
            }
        }
    }
    
    if stack.isEmpty {
        print("FRULA")
    } else {
        print(String(stack))
    }
}

solution()
