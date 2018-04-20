//
//  WKWebVC.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/20/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit
import WebKit

class WKWebVC: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var urlWikiString: String?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlWiki = URL(string: urlWikiString ?? "") else { return }
        let myRequest = URLRequest(url: urlWiki)
        webView.load(myRequest)
    }
    
}
