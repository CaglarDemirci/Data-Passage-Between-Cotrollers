//
//  SecondViewController.swift
//  DataPassageBetweenCotrollers
//
//  Created by Papcorns on 22.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    
    var mesaj : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageLabel.text = mesaj
    }
    
    @IBAction func notificationCenterTapped(_ sender: Any) {
        
        NotificationCenter.default.post(name: .myNotificationKey, object: nil)
    }

}
