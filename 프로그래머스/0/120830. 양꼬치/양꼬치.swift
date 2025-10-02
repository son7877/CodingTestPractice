import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var free:Int = n/10
    return n * 12000 + (k-free) * 2000
}