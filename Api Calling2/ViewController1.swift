//
//  ViewController1.swift
//  Api Calling2
//
//  Created by Neel  on 06/08/23.
//

import UIKit


class ViewController1: UIViewController {
    var webv = String()
    @IBOutlet weak var website: UIWebView!
        override func viewDidLoad() {
        super.viewDidLoad()
            website.loadRequest(URLRequest(url: URL(string: webv)!))
    }
}
