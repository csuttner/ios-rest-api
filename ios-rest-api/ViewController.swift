//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "https://www.orangevalleycaa.org/api/"
    
    class User {
        
        static func fetch(id: Int){
            let URLstring = DomainURL + "music/id/\(id)"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                    print(String.init(data: data!, encoding: .ascii) ?? "no data")
                }
                task.resume()
            }
        }
    }

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        User.fetch(id: 1)
    }


}

