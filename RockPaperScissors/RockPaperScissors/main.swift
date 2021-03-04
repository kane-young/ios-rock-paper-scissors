//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class RockPaperScissorsGame {
    enum Hand: String, CaseIterable, Comparable {
        static func < (lhs: RockPaperScissorsGame.Hand, rhs: RockPaperScissorsGame.Hand) -> Bool {
            if (lhs == .scissors && rhs == .rock)
            || (lhs == .paper && rhs == .scissors)
            || (lhs == .rock && rhs == .paper) {
                return true
            } else {
                return false
            }
        }

        case none = "0"
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }

    enum GameError: Error {
        case invalidInput
    }

    func startGame() {
        var isRepeat = false
        
        repeat {
            guard let computersHand = Hand.allCases.randomElement(),
                  computersHand != .none else {
                continue
            }
            
            let userHand: Hand
            
            do {
                userHand = try getHandByUser()
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                continue
            }

            isRepeat = gameResult(userHand, vs: computersHand)
        } while isRepeat
    }
    
    func gameResult(_ usersHand: Hand, vs computersHand: Hand) -> Bool {
        if usersHand == .none {
            print("게임종료")
            return false
        } else if usersHand == computersHand {
            print("비겼습니다.")
            return true
        } else if usersHand > computersHand {
            print("이겼습니다.")
            return false
        } else {
            print("졌습니다.")
            return false
        }
    }
        
    func getHandByUser() throws -> Hand {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userInput = readLine() else {
            throw GameError.invalidInput
        }
        
        guard let userHand = Hand(rawValue: userInput) else {
            throw GameError.invalidInput
        }

        return userHand
    }
}

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startGame()
