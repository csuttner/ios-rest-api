//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "https://www.orangevalleycaa.org/api/"
    
    class Music: Codable {
        
        let id: String?
        let music_url: String?
        let name: String?
        let description: String?
            
        static func fetch(id: Int){
            let URLstring = DomainURL + "music/id/\(id)"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                    if let newMusic = try? JSONDecoder().decode(Music.self, from: data!) {
                        print(newMusic.id ?? "no id")
                        print(newMusic.music_url ?? "no url")
                        print(newMusic.name ?? "name")
                        print(newMusic.description ?? "no description")
                    }
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
        Music.fetch(id: 1)
    }


}

