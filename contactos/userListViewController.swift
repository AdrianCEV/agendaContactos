//
//  userListViewController.swift
//  contactos
//
//  Created by Apps2m on 04/02/2021.
//  Copyright © 2021 user176616. All rights reserved.
//

import UIKit

class usersListViewController: UIViewController {


    @IBOutlet weak var usersList: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()

            usersList.dataSource = self
            usersList.delegate = self
            
        }
    

}
