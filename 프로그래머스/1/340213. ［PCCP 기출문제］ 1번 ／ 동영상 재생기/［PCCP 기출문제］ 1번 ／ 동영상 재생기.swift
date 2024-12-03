//
//  main.swift
//  PCCP_lv1_movie_player
//
//  Created by 안홍범 on 12/2/24.
//

import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    var result = ""
    
    let video_len = video_len.split(separator: ":").map { Int($0)! } // 동영상 길이
    let pos = pos.split(separator: ":").map { Int($0)! } // 기능이 수행되기 직전의 재생위치
    let op_start = op_start.split(separator: ":").map { Int($0)! } // 오프닝 시작 시각
    let op_end = op_end.split(separator: ":").map { Int($0)! } // 오프닝 종료 시각
    
    // 초단위로 변환
    var video_len_sec = video_len[0] * 60 + video_len[1]
    var pos_sec = pos[0] * 60 + pos[1]
    var op_start_sec = op_start[0] * 60 + op_start[1]
    var op_end_sec = op_end[0] * 60 + op_end[1]
    
    var result_sec = 0

    // commands의 원소는 "next", "prev" 중 하나
    for command in commands {
        if pos_sec >= op_start_sec && pos_sec <= op_end_sec {
            pos_sec = op_end_sec
        }
        
        switch command {
            case "next":
                if video_len_sec - pos_sec > 10 {
                    pos_sec += 10
                } else {
                    pos_sec = video_len_sec
                }
            case "prev":
                if pos_sec > 10 {
                    pos_sec -= 10
                } else {
                    pos_sec = 0
                }
            default:
                print("error")
        }
    }
    
    
    // 오프닝 시간에 포함되는지 확인
    if pos_sec >= op_start_sec && pos_sec <= op_end_sec {
        result_sec = op_end_sec
    } else {
        result_sec = pos_sec
    }
    
    // result_sec -> result "00:00" 형식으로 변환
    let result_min = result_sec / 60
    result_sec = result_sec % 60
    
    result = String(format: "%02d:%02d", result_min, result_sec)
    
    return result
}

