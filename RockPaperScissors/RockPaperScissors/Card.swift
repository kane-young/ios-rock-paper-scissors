//
//  Card.swift
//  RockPaperScissors
//
//  Created by 강인희 on 2020/11/04.
//

import Foundation

struct Card{
    var cardIdx: Int //카드패
    let checkWinOrLose = [2,3,1] // 승패결정확인용 배열
    
    init() {
        self.cardIdx = 0
    }
    
    //승패결정
    func playGame(_ idx1: Int, _ idx2: Int) -> Bool{
        if checkWinOrLose[idx1-1] == idx2{
            return false
        }else{
            return true
        }
    }
    /*
     해당 함수로 가위바위보 실행시, 호출한 구조체Card 본인의 입장에서 idx1에 본인의 idx, idx2에 상대방의 idx를 넣으면
     이겼을 때 true를 리턴, 졌을 때 false를 리턴한다.
     
     해당 함수로 묵찌빠 실행시, 호출한 구조체Card 본인의 입장에서 idx1에 상대방의 idx, idx2에 본인의 idx를 넣으면
     이겼을 때 true를 리턴, 졌을 때 false를 리턴한다.
     
     가위바위보,묵찌빠의 승패상관관계를 고려하여 하나의 게임실행함수로 만들고자 했고,
     게임이 어떤 것이냐에 따라 파라미터가 (나의 idx, 상대방의 idx) 혹은 (상대방의 idx, 나의 idx) 가 들어갈 수 있기에
     파라미터명은 idx1,idx2로 만들었다.
     
     승패를 확인하기 위해서 winOrLose 배열을 사용하고 배열의 index와 idx1을 매칭시키고, 배열의 value와 idx2를 매칭시켜 승패상관관계를 확인한다.
     */
}


