//
//  main.swift
//  BJ1092
//
//  Created by 안홍범 on 1/6/25.
//

import Foundation

let N = Int(readLine()!)!
let cranes = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    .sorted{ $0 > $1 } // 내림차순 정렬

let M = Int(readLine()!)!
let boxes = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    .sorted{ $0 > $1 } // 내림차순 정렬

func solution() {
    var boxIndex = 0 // 현재 박스를 가리키는 인덱스
    var count = 0
    var remainingBoxes = M // 남은 박스 개수
    var used = Array(repeating: false, count: M) // 박스 처리 여부

    if cranes[0] < boxes[0] {
        print(-1)
        return
    }

    while remainingBoxes > 0 {
        count += 1
        boxIndex = 0

        for crane in cranes {
            // 현재 크레인이 처리할 수 있는 박스 탐색
            while boxIndex < M {
                if !used[boxIndex] && crane >= boxes[boxIndex] {
                    used[boxIndex] = true // 박스를 처리
                    remainingBoxes -= 1
                    boxIndex += 1 // 다음 박스로 이동
                    break
                }
                boxIndex += 1 // 조건에 맞지 않으면 다음 박스로
            }
        }
    }

    print(count)
}


solution()

// 시간 초과 : 3중 for문으로 인한 시간 초과인듯


