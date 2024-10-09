//
//  main.swift
//  BJ1991
//
//  Created by 안홍범 on 10/9/24.
//

import Foundation

let depth = Int(readLine()!)!

let tree = (0..<depth).map{_ in
    readLine()!
        .split(separator: " ")
        .map{String($0)}
}

func solution() {
    var preOrder = ""
    var inOrder = ""
    var postOrder = ""
    
    func dfs(_ x: String) {
        if x == "." {
            return
        }
        
        preOrder += x
        dfs(tree.first{$0[0] == x}![1]) // 왼쪽 자식 노드
        inOrder += x
        dfs(tree.first{$0[0] == x}![2]) // 오른쪽 자식 노드
        postOrder += x
    }
    
    dfs("A")
    
    print(preOrder)
    print(inOrder)
    print(postOrder)
}

solution()


