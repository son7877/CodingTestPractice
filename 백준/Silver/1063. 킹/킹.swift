//
//  main.swift
//  BJ1063
//
//  Created by 안홍범 on 12/17/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { String($0) }

let N = Int(input[2])!

let xLocation = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
let reverseXLocation = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H"] // 행을 역으로 찾기 위해 사용

var kingX = xLocation[String(input[0].first!)]!
var kingY = Int(String(input[0].last!))!

var stoneX = xLocation[String(input[1].first!)]!
var stoneY = Int(String(input[1].last!))!

for _ in 1...N {
    let command = readLine()!
    move(command: command)
}

func move(command: String) {
    var (dx, dy) = (0, 0)
    
    switch command {
    case "R": dx = 1
    case "L": dx = -1
    case "B": dy = -1
    case "T": dy = 1
    case "RT": dx = 1; dy = 1
    case "LT": dx = -1; dy = 1
    case "RB": dx = 1; dy = -1
    case "LB": dx = -1; dy = -1
    default: return
    }
    
    let nextKingX = kingX + dx
    let nextKingY = kingY + dy
    
    if nextKingX < 1 || nextKingX > 8 || nextKingY < 1 || nextKingY > 8 { // 체스판을 벗어나면
        return
    }
    
    if nextKingX == stoneX && nextKingY == stoneY { // 킹이 돌과 만나면
        let nextStoneX = stoneX + dx
        let nextStoneY = stoneY + dy
        
        if nextStoneX < 1 || nextStoneX > 8 || nextStoneY < 1 || nextStoneY > 8 { // 돌이 체스판을 벗어나면
            return
        }
        
        stoneX = nextStoneX
        stoneY = nextStoneY
    }
    
    kingX = nextKingX
    kingY = nextKingY
}

print("\(reverseXLocation[kingX]!)\(kingY)")
print("\(reverseXLocation[stoneX]!)\(stoneY)")
