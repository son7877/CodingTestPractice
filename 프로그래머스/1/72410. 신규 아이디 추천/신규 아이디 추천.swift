import Foundation

func solution(_ new_id:String) -> String {
    
    // 1. 대문자를 소문자로 치환
    var firstFilter = new_id.lowercased()
    
    var secondFilter = ""
    
    // 2. 허용된 특수문자가 아닌 특수문자 모두 제거
    for char in firstFilter {
        if (char >= "a" && char <= "z") || (char >= "0" && char <= "9") || char == "." || char == "-" || char == "_" {
            secondFilter.append(char)
        }
    }
    
    // 3. 2개 이상 연속되는 마침표를 1개로 치환
    var thirdFilter = ""
    for char in secondFilter {
        if char == "." && thirdFilter.last == "." {
            continue
        }
        thirdFilter.append(char)
    }
    
    // 4. 마침표가 처음이나 끝에 위치한다면 제거하기
    var fourthFilter = thirdFilter
    
    while fourthFilter.first == "." {
        fourthFilter.removeFirst()
    }
    
    while fourthFilter.last == "." {
        fourthFilter.removeLast()
    }
    
    // 5. 빈 문자열이면 "a" 대입
    var fifthFilter = fourthFilter
    if fifthFilter == "" {
        fifthFilter.append("a")
    }
    
    // 6. 16자 이상이면 15자를 초과하는 문자 제거 후 마침표가 끝에 존재하면 그것도 제거
    var sixthFilter = fifthFilter
    while sixthFilter.count >= 16 {
        sixthFilter.removeLast()
    }
    
    while sixthFilter.last == "." {
        sixthFilter.removeLast()
    }
    
    // 7. 2자 이하라면 길이가 3이 될 때까지 끝 문자를 반복해서 붙이기
    var seventhFilter = sixthFilter
    while seventhFilter.count < 3 {
        seventhFilter.append(seventhFilter.last!)
    }
    
    return seventhFilter
}