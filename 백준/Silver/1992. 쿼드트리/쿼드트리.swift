//
//  main.swift
//  BJ1992
//
//  Created by 안홍범 on 11/10/24.
//

import Foundation

let N = Int(readLine()!)!
let map = (1...N).map{_ in
    readLine()!
        .map{String($0)}
        .map{Int($0)!} // 0 or 1
}

func solution() {
    var result = ""
    
    func check(_ x: Int, _ y: Int, _ size: Int) {
        let first = map[x][y]
        var isSame = true
        
        for i in x..<x+size {
            for j in y..<y+size {
                if map[i][j] != first {
                    isSame = false
                    break
                }
            }
        }
        
        if isSame {
            result += "\(first)"
        } else {
            result += "("
            let newSize = size / 2
            check(x, y, newSize)
            check(x, y+newSize, newSize)
            check(x+newSize, y, newSize)
            check(x+newSize, y+newSize, newSize)
            result += ")"
        }
    }
    
    check(0, 0, N)
    print(result)
}

solution()


