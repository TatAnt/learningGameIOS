//
//  CooseGameViewController.swift
//  Final_Project_Kiddo
//
//  Created by Tatiana Antokhine on 2020-11-27.
//

import UIKit
import CoreData

class CooseGameViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    var playerName: String = ""
    var age: Int = 0
    var playerId: UUID?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = playerName
       // lblAge.text = String(age)
        //getDataById()
        // Do any additional setup after loading the view.
    }
    
    
   func getDataById(){
        if playerName != ""{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player1")
        let idString = playerId?.uuidString
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
        
        fetchRequest.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(fetchRequest) //to retrieve data we should use fetch()
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    
                    if let name = result.value(forKey: "name") as? String{
                        lblName.text = name
                    }
                    
                    if let age = result.value(forKey: "age") as? Int{
                        lblAge.text = String(age)
                    }
                   
                }
            }
        }catch{
            print("Error")
        }
        }else{
            lblName.text = "No name..."
            
        }

        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
