//
//  ViewController.swift
//  yogaYoutube
//
//  Created by 이가은 on 2022/10/02.
//

import UIKit

class ViewController: UIViewController {
    
    var modal = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        modal.getVideos()
        
    }


}

