//
//  main.swift
//  BJ2630
//
//  Created by 안홍범 on 10/6/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (0..<N).map{ _ in
    readLine()!.split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    var white = 0
    var blue = 0
    
    func divide(_ x: Int, _ y: Int, _ n: Int) {
        let color = arr[x][y]
        var flag = true
        
        // 종이의 색이 모두 같은지 확인
        for i in x..<x+n {
            for j in y..<y+n {
                if color != arr[i][j] {
                    flag = false
                    break
                }
            }
        }
        
        // 모두 같은 색이면 해당 색의 종이 개수 증가
        if flag {
            if color == 0 {
                white += 1
            } else {
                blue += 1
            }
        }
        else { // 모두 같은 색이 아니면 4등분하여 다시 확인
            divide(x, y, n/2)
            divide(x, y+n/2, n/2)
            divide(x+n/2, y, n/2)
            divide(x+n/2, y+n/2, n/2)
        }
    }
    
    // 시작점 (0, 0)으로부터 N*N 크기의 종이를 4등분하여 확인
    divide(0, 0, N)
    
    print(white)
    print(blue)
}

solution()
