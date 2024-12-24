//
//  main.swift
//  BJ15973
//
//  Created by 안홍범 on 12/24/24.
//

import Foundation

let A = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let B = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (Ax1, Ay1, Ax2, Ay2) = (A[0], A[1], A[2], A[3])
let (Bx1, By1, Bx2, By2) = (B[0], B[1], B[2], B[3])

func solution() {
    if Ax2 < Bx1
        || Bx2 < Ax1
        || Ay2 < By1
        || By2 < Ay1 {
        print("NULL")
    } else if
        (Ax2 == Bx1 && Ay2 == By1)
            || (Ax2 == Bx1 && Ay1 == By2)
            || (Ax1 == Bx2 && Ay2 == By1)
            || (Ax1 == Bx2 && Ay1 == By2) {
        print("POINT")
    } else if
        Ax2 == Bx1
            || Ax1 == Bx2
            || Ay2 == By1
            || Ay1 == By2 {
        print("LINE")
    } else {
        print("FACE")
    }
}

solution()

