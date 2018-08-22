//
//  ViewController.swift
//  people
//
//  Created by Mohammed Alsafi on 22/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON


let userProvider = MoyaProvider<Users>()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var users = [User]()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.white
    
  
        userProvider.request(.ReadUser) { result in
            switch result {
            case .success(let response):
                let jsonData = try! response.mapJSON()
                let json = JSON(jsonData)
                if let usersArray = json.to(type: User.self) {
                    for user in usersArray as! [User] {
                        self.users.append(user)
                    }
                    self.tableView.reloadData()
                }
            
            case .failure(let erorr):
                print(erorr)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.setUsers(users: user)
        return cell
        
    }
}

