import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack = [Character]()
    var k = k
    
    for i in number {
        while k > 0 && !stack.isEmpty && stack.last! < i {
            stack.removeLast()
            k -= 1
        }
        stack.append(i)
    }
    
    while k > 0 {
        stack.removeLast()
        k -= 1
    }
    
    return String(stack)
}