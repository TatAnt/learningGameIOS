//
//  MathViewController.swift
//  Final_Project_Kiddo
//
//  Created by Tatiana Antokhine on 2020-11-27.
//

import UIKit

var btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
extension UIButton{
    func makeRoundButton(){
        self.backgroundColor = .yellow
        self.layer.cornerRadius = 35
        self.clipsToBounds = true
        self.layer.borderWidth = 10.0
       // self.layer.borderColor = (UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1.0).cgColor)
        self.layer.borderColor = UIColor.orange.cgColor
        self.titleLabel?.font =  UIFont(name: "Superclarendon-Black", size: 62)
        
    }
}

var lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 325, height: 100))
extension UILabel{
    func roundLabel(){
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.layer.borderWidth = 5.0
        self.font =  UIFont(name: "Superclarendon-Black", size: 24)
    }
}

class MathViewController: UIViewController {

    
    @IBOutlet weak var lblstars: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var lblCongrats: UILabel!
    
    let quiz = QBank()
    
    var qNum: Int = 0
    var score: String = ""
    var count: Int = 0
    var playerAnswer: Int = 0
    let arr = ["Bravo!", "Intelligent!", "Well Done!", "Good Job!", "Congradulations!"]
  

    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()

        btn1.makeRoundButton()
        btn2.makeRoundButton()
        btn3.makeRoundButton()
        lblCongrats.roundLabel()
        btn1.setTitleColor(UIColor.green, for: .normal)
        btn2.setTitleColor(UIColor.red, for: .normal)
        btn3.setTitleColor(UIColor.systemPink, for: .normal)
    }
    
    func changeCongrats()
    {
        let index1 = Int(arc4random_uniform(5))
        lblCongrats.text = String(arr[index1])
    }
    
    @IBAction func btnAnswer(_ sender: UIButton) {
        if sender.tag == playerAnswer {
            sender.backgroundColor = UIColor.green
            lblCongrats.backgroundColor = UIColor.green
            changeCongrats()
            
             count += 1
    
        }else {
            lblCongrats.text = "Hmmm!"
            sender.backgroundColor = UIColor.red
            lblCongrats.backgroundColor = UIColor.red
        }
      
          
        
        qNum += 1
        nextQuestion()
    }
    
    func nextQuestion(){
       
       
        if qNum < quiz.qCatalog.count {
            
            lblQuestion.text = quiz.qCatalog[qNum].quest
            
            btn1.setTitle(quiz.qCatalog[qNum].choice1, for: UIControl.State.normal)
            btn2.setTitle(quiz.qCatalog[qNum].choice2, for: UIControl.State.normal)
            btn3.setTitle(quiz.qCatalog[qNum].choice3, for: UIControl.State.normal) 
            
            playerAnswer = quiz.qCatalog[qNum].correctChoice
        
        }else {
            lblScore.text = "Your result: "
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "star.png")
            let attachmentString = NSAttributedString(attachment: attachment)
            let myString = NSMutableAttributedString(string: score)
            if (count == 1){
                myString.append(attachmentString)
            }else if(count == 2){
                myString.append(attachmentString)
                myString.append(attachmentString)
            }
            else if(count == 3){
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
            }
            else if(count == 4){
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
            }
            else if(count == 5){
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
            }
            else if(count == 6){
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
            }
            else if(count == 7){
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
                myString.append(attachmentString)
            }
           
            lblstars.attributedText = myString
            
            let alert = UIAlertController(title: "Thank you!", message: "Great Result!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Play again?", style: .default, handler:{action in self.restartAplication()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }

    func restartAplication(){
        
        //score = 0
        qNum = 0
        nextQuestion()
        
    }
    
            
    @objc func updateUI(){

        btn1.backgroundColor = UIColor.yellow
        btn2.backgroundColor = UIColor.yellow
        btn3.backgroundColor = UIColor.yellow
        lblCongrats.backgroundColor = UIColor.yellow
        lblCongrats.text = ""
        btn1.setTitleColor(UIColor.green, for: .normal)
        btn2.setTitleColor(UIColor.red, for: .normal)
        btn3.setTitleColor(UIColor.systemPink, for: .normal)
    }
}

