func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        // OR 연산 수행
        var orOperation = arr1[i] | arr2[i]
        var binaryResult = String(orOperation, radix: 2)
        
        // n 자릿수 맞추기
        while binaryResult.count < n {
            binaryResult = "0" + binaryResult
        }
        
        // 1은 #, 0은 공백으로 변환하기
        var secretMap = binaryResult.replacingOccurrences(of: "1", with: "#")
        secretMap = secretMap.replacingOccurrences(of: "0", with: " ")
        
        answer.append(secretMap)
    }
    
    return answer
}