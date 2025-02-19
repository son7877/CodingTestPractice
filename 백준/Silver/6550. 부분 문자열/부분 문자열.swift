//
//  main.swift
//  BJ6550
//
//  Created by 안홍범 on 2/19/25.
//

import Foundation

while let input = readLine() {
    let temp = input
        .split(separator: " ")
        .map{String($0)}
    
    let (text, needle) = (
        temp[1].map{String($0)},
        temp[0].map{String($0)}
    )
    
    var tIdx = 0, nIdx = 0
    while tIdx < text.count && nIdx < needle.count {
        if text[tIdx] == needle[nIdx] {
            nIdx += 1
        }
    
        tIdx+=1
    }
    
    print(nIdx == needle.count ? "Yes" : "No")
}
