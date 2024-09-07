//
//  main.swift
//  BJ28702
//
//  Created by 안홍범 on 9/7/24.
//

import Foundation

/*
 3 and 5의 배수 FizzBuzz
 3의 배수 but 5의 배수가 아닌 경우 Fizz
 5의 배수 but 3의 배수가 아닌 경우 Buzz
 둘 다 아닌 경우 숫자 그대로 출력
 */

let first = readLine()!
let second = readLine()!
let third = readLine()!

var final = 0

let arr = [first,second,third]

if Int(first) != nil {
    final = Int(first)! + 3
} else if Int(second) != nil {
    final = Int(second)! + 2
} else {
    final = Int(third)! + 1
}

if final % 3 == 0  && final % 5 == 0 {
    print("FizzBuzz")
} else if final % 3 == 0 {
    print("Fizz")
} else if final % 5 == 0 {
    print("Buzz")
} else {
    print(final)
}


