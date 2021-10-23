//
//  ViewController.swift
//  DataPassageBetweenCotrollers
//
//  Created by Papcorns on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var galeryTableView: UITableView!
    @IBOutlet weak var userTextField: UITextField!
    
    var items : [Galery] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        galeryTableView.delegate = self
        galeryTableView.dataSource = self
        setUp()
    }
    func setUp(){
        let segue = Galery(name: "Segue")
        let properties = Galery(name: "Properties")
        items.append(segue)
        items.append(properties)
  
    }
    func dataTransferWithProperty(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        destinationVC.mesaj = userTextField.text!
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch selectedIndex {
        case 0 :
            if   segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
                destinationVC.mesaj = userTextField.text!
               
            }
                default:
                    break
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        if selectedIndex == 1 {
            dataTransferWithProperty()
        }else {
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        let cell = galeryTableView.dequeueReusableCell(withIdentifier: "PassageCell", for: indexPath) as! SpecialTableViewCell
        cell.titleLabel.text = items[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
