//
//  main.swift
//  BJ3758
//
//  Created by 안홍범 on 3/28/25
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let test = readLine()!.split(separator: " ").map { Int($0)! }
    let n = test[0] // 팀 개수
    let k = test[1] // 문제 개수
    let t = test[2] // 우리 팀의 ID
    let m = test[3] // 제출 횟수

    // 팀 정보 초기화 [팀 ID, 최종 점수, 제출 횟수, 마지막 제출 시간]
    var teams = Array(repeating: [0, 0, 0, 0], count: n + 1)
    
    // 팀별 문제 점수를 저장하는 딕셔너리
    var teamQuestions: [Int: [Int]] = [:]
    
    for entryIndex in 0..<m {
        let entry = readLine()!.split(separator: " ").map { Int($0)! }
        let (teamId, no, score) = (entry[0], entry[1], entry[2])

        // 팀별 문제 점수 배열 초기화
        if teamQuestions[teamId] == nil {
            teamQuestions[teamId] = Array(repeating: 0, count: k + 1)
        }

        // 팀 ID 저장
        teams[teamId][0] = teamId

        // 문제 번호별 최고 점수 갱신
        teamQuestions[teamId]![no] = max(teamQuestions[teamId]![no], score)

        // 제출 횟수 증가
        teams[teamId][2] += 1

        // 마지막 제출 시간 갱신
        teams[teamId][3] = entryIndex
    }

    // 각 팀의 최종 점수를 계산하여 저장
    for (teamId, questions) in teamQuestions {
        teams[teamId][1] = questions.reduce(0, +) // 문제 점수 합산
    }

    teams.sort {
        if $0[1] != $1[1] { return $0[1] > $1[1] }         // 점수 내림차순
        if $0[2] != $1[2] { return $0[2] < $1[2] }         // 제출 횟수 오름차순
        return $0[3] < $1[3]                               // 마지막 제출 시간 오름차순
    }

    var rank = 1
    for team in teams {
        if team[0] == 0 { continue } // 유효하지 않은 팀 건너뛰기

        if team[0] != t {
            rank += 1
        } else {
            break
        }
    }

    print(rank)
}
