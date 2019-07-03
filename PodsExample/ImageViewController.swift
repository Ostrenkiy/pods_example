//
//  ImageViewController.swift
//  PodsExample
//
//  Created by Ostrenkiy on 03/07/2019.
//  Copyright © 2019 Ostrenkiy. All rights reserved.
//

import UIKit
import Nuke

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://raw.githubusercontent.com/Alamofire/Alamofire/master/alamofire.png")!
        Nuke.loadImage(with: url, into: imageView)
    }

}
