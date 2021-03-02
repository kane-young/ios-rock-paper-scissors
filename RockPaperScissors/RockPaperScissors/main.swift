var computerRandomNumbers: [Int] = [1,2,3]
var computerRandomNumber: Int = 0
var getNumberByUser:Int = 0
var flag: Int = 0

class RockPaperScissors {
    /// 게임 스타트 메서드
    func gameStart() {
        makeRandomResult()
        printGameGuide()
        getInputByUser()
        checkResultAndPrintResultOfGame()
    }
    
    /// 컴퓨터 랜덤 가위바위보
    func makeRandomResult() {
        computerRandomNumber = Int.random(in: 1...3)
    }
    
    /// 최초 출력 메서드
    func printGameGuide() {
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
    }

    /// 사용자 입력 받는 메서드
    func getInputByUser() {
        getNumberByUser = Int(readLine()!)!
    }

    /// 결과 판별 후 출력 메서드
    func checkResultAndPrintResultOfGame() {
        for index in 0...2 {
            if getNumberByUser == computerRandomNumbers[index]
            { flag += 1 }
        }
        print("확인용 사용자 가위바위보:\(getNumberByUser)")
        print("확인용컴퓨터 가위바위보:\(computerRandomNumber)")
        print("확인용 flag \(flag)")
        
        if flag == 0 {
            if getNumberByUser == 0 {
                return
            }
            else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                self.gameStart()
            }
        } else if flag != 0 {
            if getNumberByUser == computerRandomNumber {
                print("비겼습니다!")
                self.gameStart()
            }
        }
    }
}

RockPaperScissors().gameStart()

//
