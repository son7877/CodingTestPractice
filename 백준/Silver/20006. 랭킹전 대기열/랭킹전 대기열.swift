import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let (p, m) = (input[0], input[1]) // 총 인원수, 방 당 정원

var players = [(Int, String)]()
for _ in 0..<p {
    let user = readLine()!.split(separator: " ")
    let level = Int(user[0])!
    let nickname = String(user[1])
    players.append((level, nickname))
}

func solution() {
    var rooms = [[(Int, String)]]() 

    for player in players {
        let (level, nickname) = player
        var isPlaced = false

        for i in 0..<rooms.count {
            let room = rooms[i]
            /*
                방이 비어있지 않고, 
                방의 첫 번째 플레이어와 레벨 차이가 10 이하이며, 
                방 정원이 초과되지 않을 경우
            */
            if !room.isEmpty && abs(room[0].0 - level) <= 10 && room.count < m {
                rooms[i].append((level, nickname))
                isPlaced = true
                break
            }
        }

        if !isPlaced {
            rooms.append([(level, nickname)])
        }
    }

    for room in rooms {
        if room.count == m {
            print("Started!")
        } else {
            print("Waiting!")
        }
        for player in room.sorted(by: { $0.1 < $1.1 }) { // 닉네임 기준 사전순 정렬
            print("\(player.0) \(player.1)")
        }
    }
}

solution()