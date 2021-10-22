//
//  ViewController.swift
//  DataPassageBetweenCotrollers
//
//  Created by Papcorns on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var GalerytableView: UITableView!
    @IBOutlet weak var userTextField: UITextField!
    
    var items : [Galery] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GalerytableView.backgroundColor = .white
        GalerytableView.delegate = self
        GalerytableView.dataSource = self
        setUp()
    }
    func setUp(){
        let name1 = Galery(name: "Segue")
        items.append(name1)
  
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
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        let cell = GalerytableView.dequeueReusableCell(withIdentifier: "PassageCell", for: indexPath) as! SpecialTableViewCell
        cell.titleLabel.text = items[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
