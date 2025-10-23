import Foundation

import Foundation

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    
    var onBridge: [(weight: Int, exitTime: Int)] = [] 
    var head = 0
    
    var time = 0 
    var currentWeight = 0 
    var truckIndex = 0 
    
    while head < onBridge.count || truckIndex < truck_weights.count {
        time += 1
        
        // 다리를 다 건넌 트럭
        if head < onBridge.count && onBridge[head].exitTime == time {
            let finishedTruck = onBridge[head]
            currentWeight -= finishedTruck.weight
            head += 1
        }
        
        // 다리에 새 트럭 진입
        if truckIndex < truck_weights.count {
            let nextTruck = truck_weights[truckIndex]
            let currentTrucks = onBridge.count - head
            
            // 현재 다리위 트럭 개수과 다리 위 트럭 무게 조건 확인
            if currentTrucks < bridge_length && currentWeight + nextTruck <= weight {
                onBridge.append((weight: nextTruck, exitTime: time + bridge_length))
                currentWeight += nextTruck
                truckIndex += 1
            }
        }
    }
    
    
    return time
}