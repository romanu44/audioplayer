//
//  ViewController2.swift
//  Reproductor Sonido Largo
//
//  Created by Rodrigo Márquez on 11/2/17.
//  Copyright © 2017 Rodrigo Márquez. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let url = URL(string:"https://soundcloud.com/rvrrv")!
        let request = URLRequest(url: url)
        soundcloud.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopload(_ sender: Any) {
        soundcloud .reload()
    }
    
    @IBOutlet weak var soundcloud: UIWebView!
}
