//
//  SFSafariVC.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/20/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit
import SafariServices

class SFSafariVC: UIViewController, SFSafariViewControllerDelegate, WebProtocol {
    
    var getLink: String?
    var vc: SFSafariViewController!
    var isDone = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        guard let link = getLink, let urlWiki = URL(string: link) else { return }
        vc = SFSafariViewController(url: urlWiki, entersReaderIfAvailable: true)
        vc.delegate = self
        
        if isDone {
            dismiss(animated: true)
        } else {
            self.present(vc, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isDone = true
    }    
}
