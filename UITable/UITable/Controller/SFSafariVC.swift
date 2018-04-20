//
//  SFSafariVC.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/20/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit
import SafariServices

class SFSafariVC: UIViewController, SFSafariViewControllerDelegate {

    var urlWikiString: String?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        guard let urlWiki = URL(string: urlWikiString ?? "") else { return }
        let vc = SFSafariViewController(url: urlWiki, entersReaderIfAvailable: true)
        vc.delegate = self
        present(vc, animated: true)
    }
    
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        dismiss(animated: true)
//    }
}
