//
//  ShapesViewController.swift
//  Final_Project_Kiddo
//
//  Created by Tatiana Antokhine on 2020-12-01.
//

import UIKit
//will complete this part after exams

class ShapesViewController: UIViewController {

    
    @IBOutlet weak var btnShape1: UIButton!
    
    @IBOutlet weak var btnShape2: UIButton!
    
    
    @IBOutlet weak var btnShape3: UIButton!
    
    //let quiz = ShapeQBank()
    var qNum: Int = 0
    let arr = ["clock.png", "triangle.png", "circle.png"]
    
    override func viewDidLoad() {
        changePics1()
        // Do any additional setup after loading the view.
    }
    
    func changePics1(){
        let index1 = Int(arc4random_uniform(3))
        switch index1{
        case 0:
            btnShape1.setImage(UIImage(named: arr[0]), for: .normal)
            btnShape2.setImage(UIImage(named: arr[1]), for: .normal)
            btnShape3.setImage(UIImage(named: arr[2]), for: .normal)

        case 1:
            btnShape1.setImage(UIImage(named: arr[1]), for: .normal)
            btnShape2.setImage(UIImage(named: arr[2]), for: .normal)
            btnShape3.setImage(UIImage(named: arr[0]), for: .normal)
        case 2:
            btnShape1.setImage(UIImage(named: arr[2]), for: .normal)
            btnShape2.setImage(UIImage(named: arr[0]), for: .normal)
            btnShape3.setImage(UIImage(named: arr[1]), for: .normal)
        default:
        print(index1)
        }
        
    }

            //lblScore.text = "Your result: "
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
