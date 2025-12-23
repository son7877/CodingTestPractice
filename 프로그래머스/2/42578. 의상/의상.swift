import Foundation

func solution(_ clothes:[[String]]) -> Int {    
    var dict = [String:Int]()
    
    for i in 0..<clothes.count {
        let name = clothes[i][0]
        let category = clothes[i][1]
        
        dict[category, default: 0] += 1
        
        
    }
    
    return dict.values.reduce(1) {
        $0 * ($1 + 1)
    } - 1
}