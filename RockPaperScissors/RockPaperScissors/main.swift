//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum cardType: String {
    case wrongType = ""
    case exit = "0"
    case rock = "1"
    case scissor = "2"
    case paper = "3"
}

class rockPaperScissorsGame {
    func gameStart() {
        var isRepeat = true
        
        while isRepeat {
            let computersCard = getComputersCard()
            let usersCard = getUserCard()
            
            switch usersCard {
            case .wrongType :
                print("잘못된 입력입니다. 다시 시도해주세요.")
            case .exit :
                isRepeat = false
            default :
                let gameResult = getGameResult(usersCard, computersCard)
                
                switch gameResult {
                case "win" :
                    print("이겼습니다.")
                case "lose" :
                    print("졌습니다.")
                default :
                    print("비겼습니다.")
                }
            }
        }
    }
    
    func getComputersCard() -> cardType {
        let randomNum = Int.random(in: 1...3)
        
        guard let computersCard = cardType(rawValue: String(randomNum))
        else {
            return .wrongType
        }
        
        return computersCard
    }
    
    func getUserCard() -> cardType {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userInput = readLine()
        else {
            return .wrongType
        }
        
        guard let userCard = cardType(rawValue: userInput)
        else {
            return .wrongType
        }
        
        return userCard
    }
    
    func getGameResult(_ usersCard: cardType, _ computersCard: cardType) -> String {
        if usersCard == computersCard {
            return "draw"
        } else if (usersCard == .rock && computersCard == .scissor)
            || (usersCard == .scissor && computersCard == .paper)
            || (usersCard == .paper && computersCard == .rock) {
            return "win"
        } else {
            return "lose"
        }
    }
}

let 강경의묵찌빠게임 = rockPaperScissorsGame()
강경의묵찌빠게임.gameStart()


