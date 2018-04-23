//
//  WKWebVC.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/20/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit
import WebKit

class WKWebVC: UIViewController, WKUIDelegate, WebProtocol {
    
    var getLink: String?
    var webView: WKWebView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonDone: UIButton!
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.frame = contentView.frame
        contentView.addSubview(webView)
    }
    
    @IBAction func buttonDoneTapped(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlWiki = URL(string: getLink ?? "") else { return }
        let myRequest = URLRequest(url: urlWiki)
        webView.load(myRequest)
    }
}
