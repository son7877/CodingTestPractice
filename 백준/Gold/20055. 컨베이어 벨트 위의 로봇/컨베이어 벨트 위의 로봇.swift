//
//  main.swift
//  BJ_20055
//
//  Created by 안홍범 on 3/9/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, K) = (input[0], input[1])
let arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution(_ N: Int, _ K: Int, _ arr: [Int]) -> Int {
    var robot = Array(repeating: false, count: N)
    var belt = arr
    var cnt = 0
    var step = 0

    while cnt < K {
        step += 1
        // 1. 벨트 회전
        belt.insert(belt.removeLast(), at: 0)
        robot.insert(robot.removeLast(), at: 0)
        robot[N - 1] = false

        // 2. 로봇 이동
        for i in stride(from: N - 2, through: 0, by: -1) {
            if robot[i] && !robot[i + 1] && belt[i + 1] > 0 { // 로봇이 있고, 다음칸에 로봇이 없고, 내구도가 0이 아니면
                robot[i] = false
                robot[i + 1] = true
                belt[i + 1] -= 1
                if belt[i + 1] == 0 { // 내구도가 0이면
                    cnt += 1
                }
            }
        }
        robot[N - 1] = false

        // 3. 로봇 올리기
        if !robot[0] && belt[0] > 0 { // 로봇이 없고, 내구도가 0이 아니면
            robot[0] = true
            belt[0] -= 1
            if belt[0] == 0 { // 내구도가 0이면
                cnt += 1
            }
        }
    }

    return step
}

print(solution(N, K, arr))
