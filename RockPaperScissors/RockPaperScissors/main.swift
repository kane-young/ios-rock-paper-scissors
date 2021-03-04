class RockPaperScissorsGame {
    enum Hand: Int, CaseIterable {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    enum GameError: Error {
        case invalidInput
    }
    
    enum GameResult: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
    }

    func startGame() {
        while true {
            guard let computersHand = makeRandomHand() else {
                return
            }
            
            var userHand: Hand = .paper
            do {
                if let notNilUserHand = try getHandByUser() {
                    userHand = notNilUserHand
                } else {
                    print("게임종료")
                    break
                }
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                continue
            }

            let gameResult = getGameResult(userHand, vs: computersHand)
            showResult(gameResult)
        }
    }
    
    func makeRandomHand() -> Hand? {
        let hands = Hand.allCases
        let random = hands.randomElement()
        return random
    }
    
    func showResult(_ input: GameResult) { // startGame 함수에서 showResult 분리하기
        let resultStatement = input.rawValue
        print(resultStatement)
    }
    
    func getGameResult(_ usersHand: Hand, vs computersHand: Hand) -> GameResult {
        if usersHand == computersHand {
            return .draw
        } else if (usersHand == .rock && computersHand == .scissors)
            || (usersHand == .scissors && computersHand == .paper)
            || (usersHand == .paper && computersHand == .rock) {
            return .win
        } else {
            return .lose
        }
    }
        
    func getHandByUser() throws -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let stringUserInput = readLine(), let integerUserInput = Int(stringUserInput) else {
            throw GameError.invalidInput
        }
        
        switch integerUserInput {
        case 0:
            return nil
        case Hand.scissors.rawValue:
            return Hand.scissors
        case Hand.rock.rawValue:
            return Hand.rock
        case Hand.paper.rawValue:
            return Hand.paper
        default:
            throw GameError.invalidInput
        }
    }
}

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startGame()
