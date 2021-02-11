//
//  QBank.swift
//  Final_Project_Kiddo
//
//  Created by Tatiana Antokhine on 2020-12-01.
//

import Foundation
class QBank{
var qCatalog = [clsQuestion]()

init(){
    qCatalog.append(clsQuestion(questTxt: " 2 + 2 = ?", select1: "4", select2: "3", select3: "10", myChoice: 1))
    qCatalog.append(clsQuestion(questTxt: "Which number is bigger?", select1: "4", select2: "9", select3: "?", myChoice: 2))
    qCatalog.append(clsQuestion(questTxt: " Which number is smaller? ", select1: "6", select2: "4", select3: "?", myChoice: 2))
    qCatalog.append(clsQuestion(questTxt: " 5 - 3", select1: "5", select2: "4", select3: "2", myChoice: 3))
    qCatalog.append(clsQuestion(questTxt: " Touch number 7 ", select1: "1", select2: "7", select3: "5", myChoice: 2))
    qCatalog.append(clsQuestion(questTxt: " Touch number 4", select1: "4", select2: "3", select3: "9", myChoice: 1))
    qCatalog.append(clsQuestion(questTxt: " Touch number 3 ", select1: "8", select2: "2", select3: "3", myChoice: 3))

}
}
