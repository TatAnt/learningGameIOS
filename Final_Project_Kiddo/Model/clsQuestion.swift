//
//  clsQuestion.swift
//  Final_Project_Kiddo
//
//  Created by Tatiana Antokhine on 2020-12-01.
//

import Foundation
class clsQuestion {
    
    let quest: String
    let choice1: String
    let choice2: String
    let choice3: String
    let correctChoice: Int
    
    init(questTxt: String, select1: String, select2: String, select3: String, myChoice:Int ){
        quest = questTxt
        choice1 = select1
        choice2 = select2
        choice3 = select3
        correctChoice = myChoice
    }
}
