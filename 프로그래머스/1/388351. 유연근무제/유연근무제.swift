func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    // 직원들은 출근 희망 시각 + 10분 까지 출근
    // 주말은 이벤트 영향 없음
    // 직원들이 설정한 시각과 실제 출근 기록을 바탕으로 이벤트 당첨자 대상이 몇 명인지 구하기
    
    var answer = 0
    var getToWork = [Int]()
    
    // 출근 시각 계산
    for i in 0..<schedules.count {
        var getToWorkTime = schedules[i] + 10
        if getToWorkTime % 100 >= 60 {
            getToWorkTime = getToWorkTime + 40
        }
        
        getToWork.append(getToWorkTime)
    }
    
    let day = (startday - 1) % 7  // 0부터 시작하는 요일로 변환
    let saturday = (6 - day + 6) % 7  // 토요일 요일 계산
    let sunday = (6 - day) % 7  // 일요일 요일 계산
    
    for i in 0..<timelogs.count {
        var count = 0

        for j in 0..<timelogs[i].count {
            if j == sunday || j == saturday { // 주말은 계산 제외
                continue
            }
            
            if timelogs[i][j] <= getToWork[i] {
                count += 1
            }
        }
        
        if count == 5 {
            answer += 1
        }
    }
    
    return answer
}
