
class RockScissorsPapper {
    enum Hand {
        case scissors
        case rock
        case papper
        case none
    }

    enum GameResult {
        case win
        case lose
        case draw
    }

    enum GameError: Error {
        case invalidInput
    }

    func gameStart() {
        while true {
            print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")

            var userInput: Hand = Hand.none
            do {
                userInput = try getInput()
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                continue
            }

            if userInput == .none {
                print("게임종료")
                break
            }

            let computerInput = makeRandomHand()
            let result = getResult(userInput, vs: computerInput)

            if result == .draw {
                print("비겼습니다!")
                continue
            } else if result == .win {
                print("이겼습니다!")
                break
            } else if result == .lose {
                print("졌습니다!")
                break
            }
        }
    }

    func getResult(_ userHand: Hand, vs computerHand: Hand) -> GameResult {
        if userHand == computerHand {
            return .draw
        }
        switch userHand {
        case .rock:
            if computerHand == .scissors { return .win }
        case .scissors:
            if computerHand == .papper { return .win }
        case .papper:
            if computerHand == .rock { return .win }
        default:
            return .lose
        }

        return .lose
    }

    func getInput() throws -> Hand {
        guard let input = readLine() else {
            throw GameError.invalidInput
        }

        switch input {
        case "0":
            return Hand.none
        case "1":
            return Hand.scissors
        case "2":
            return Hand.rock
        case "3":
            return Hand.papper
        default:
            throw GameError.invalidInput
        }
    }

    func makeRandomHand() -> Hand {
        let random = Int.random(in: 1...3)
        switch random {
        case 1:
            return Hand.scissors
        case 2:
            return Hand.rock
        case 3:
            return Hand.papper
        default:
            return Hand.none
        }
    }
}


let kane = RockScissorsPapper()
kane.gameStart()
