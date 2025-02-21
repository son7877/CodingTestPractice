import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    var result = 100
    
    for i in 0..<wires.count {
        let a = wires[i][0]
        let b = wires[i][1]
        
        graph[a].append(b)
        graph[b].append(a)
    }
    
    func dfs(_ node: Int, _ target: Int) -> Int {
        visited[node] = true
        var count = 1
        
        for next in graph[node] {
            if !visited[next] && next != target {
                count += dfs(next, target)
            }
        }
        
        return count
    }
    
    for wire in wires {
        visited = [Bool](repeating: false, count: n+1)
        let a = dfs(wire[0], wire[1])
        let b = n - a
        
        result = min(result, abs(a-b))
    }
    
    return result
}