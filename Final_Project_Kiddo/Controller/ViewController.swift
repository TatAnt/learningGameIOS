//
//  ViewController.swift
//  Final_Project_Kiddo
//
//  Created by Tatiana Antokhine on 2020-11-27.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
   
    
 
    var newName: String = ""
    var playerName: String = ""
    var playerAge: Int = 0
    var playerId: UUID?
    var idArray = [UUID]()
    var nameArray = [String]()
    
    
    @IBOutlet weak var TableView: UITableView!
    
   
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playerName = nameArray[indexPath.row]
        playerId = idArray[indexPath.row]
        self.performSegue(withIdentifier: "general", sender: nil)
    }
    
    
    @IBAction func btnGo(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlayer = NSEntityDescription.insertNewObject(forEntityName: "Player1", into: context)
      
        newPlayer.setValue(txtCountry.text!, forKey: "country")
        newPlayer.setValue(txtName.text!, forKey: "name")
       
        if let age = Int(txtAge.text!){
            newPlayer.setValue(age, forKey: "age")
        }
        newPlayer.setValue(UUID(), forKey: "id")
        
        do{
           try context.save()
            self.nameArray.append(txtName.text!)
            let index = self.nameArray.count - 1
           let indexPath = IndexPath(item: index, section: 0)
           self.TableView?.insertRows(at: [indexPath], with: .automatic)
            print("Success")
        }
        catch{
            print("Error")
        }
        performSegue(withIdentifier: "general", sender: nil)
    }
    

    @IBAction func btnDeletePlayers(_ sender: UIButton) {
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
               let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player1")
               let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
               do
               {
                   try context.execute(deleteRequest)
                   try context.save()
               }
               catch
               {
                   print ("There was an error")
               }
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.reloadData()
        TableView.dataSource = self
        TableView.delegate = self
        getData()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        getData()
    }

   @objc func getData(){
      nameArray.removeAll(keepingCapacity: false)
      idArray.removeAll(keepingCapacity: false)
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          let context = appDelegate.persistentContainer.viewContext
          
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player1")
          fetchRequest.returnsObjectsAsFaults = false
          
          do{
              let results = try context.fetch(fetchRequest) 
              if results.count > 0 {
                  for result in results as! [NSManagedObject]{
                      if let name = result.value(forKey: "name") as? String{
                         self.nameArray.append(name)
                       
                      }
                      if let playerId = result.value(forKey: "id") as? UUID{
                          self.idArray.append(playerId)
                      }
                  }
              }
          }
          catch{
              print("Error")
          }

      }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier ==  "general"{
            let destination = segue.destination as! CooseGameViewController
            destination.playerName = playerName
            destination.playerId = playerId
    }
    
//have to study how to implement it:
}
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
    case .insert: self.TableView.insertRows(at: [newIndexPath!], with: .automatic)
    case .delete: self.TableView.deleteRows(at: [indexPath!], with: .automatic)
    case .update: self.TableView.reloadRows(at: [indexPath!], with: .automatic)
    case .move: self.TableView.moveRow(at: indexPath!, to: newIndexPath!)
    default: break
    }
}
}
