func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var answer = 0
    var cache = [String]()
    
    if cacheSize == 0 {
        return cities.count * 5 
    }
    
    for city in cities {
        let processedCity = city.uppercased()
        
        // 캐시에 도시 데이터가 존재하는 경우
        if let hitIndex = cache.firstIndex(of: processedCity) {
            answer += 1
            cache.remove(at: hitIndex)
            cache.insert(processedCity, at: 0)
        } else { // 캐시에 도시 데이터가 존재하지 않을 경우
            answer += 5
            cache.insert(processedCity, at: 0)
            
            if cache.count > cacheSize {
                cache.popLast()
            }
        }
    }
    
    
    return answer
}