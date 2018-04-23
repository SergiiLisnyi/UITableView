//
//  UIWebViewVC.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/20/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class UIWebVC: UIViewController, WebProtocol {
   
    var getLink: String?
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlWiki = URL(string: getLink ?? "") else { return }
        let request = URLRequest(url: urlWiki)
        webView.loadRequest(request)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if(webView.canGoBack) {
            webView.goBack()
        } else {
            dismiss(animated: true)
        }
    }
}
