//
//  ViewController.swift
//  PodsExample
//
//  Created by Ostrenkiy on 03/07/2019.
//  Copyright © 2019 Ostrenkiy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        loadJSON()
    }
    
    func loadJSON() {
        Alamofire.request("https://swapi.co/api/people/").responseJSON { response in
            switch response.result {
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            case .success(let data):
                let json = JSON(data)
                
                var names = [String]()
                for personJSON in json["results"].arrayValue {
                    let name = personJSON["name"].stringValue
                    names.append(name)
                }
                
                self.names = names
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

