//
//  UIWebViewVC.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/20/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class UIWebVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var urlWikiString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlWiki = URL(string: urlWikiString ?? "") else { return }
        let request = URLRequest(url: urlWiki)
            webView.loadRequest(request)
    }
}
