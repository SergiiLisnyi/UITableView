//
//  DetailController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/16/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var showTextButton: UIButton!
    @IBOutlet weak var viewForOpacity: UIView!
    @IBOutlet weak var constrainHeightViewToSuperView: NSLayoutConstraint!
    @IBOutlet weak var constrainBottomTopToView: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var openWikiButton: UIButton!
    
    let highPriority = Float(999)
    var isTextOpen = false
    var model: EntityProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = model?.getDescr()
        self.title = model?.getName()
        viewForOpacity.opacityGradient()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showTextButtonTapped(_ sender: UIButton) {
        if !isTextOpen {
            UIView.transition(with: scrollView,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.showTextButton.setTitle("Less", for: .normal)
                                self.constrainHeightViewToSuperView.priority = UILayoutPriority.defaultLow
                                self.constrainBottomTopToView.priority = UILayoutPriority.defaultLow
                                self.viewForOpacity.isHidden = true
                                self.isTextOpen = true
                                
            })
        } else {
            UIView.transition(with: scrollView,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.showTextButton.setTitle("More", for: .normal)
                                self.constrainHeightViewToSuperView.priority = UILayoutPriority(self.highPriority)
                                self.constrainBottomTopToView.priority = UILayoutPriority(self.highPriority)
                                self.viewForOpacity.isHidden = false
                                self.isTextOpen = false
            })
        }
    }
    
    @IBAction func openWikiButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose browser", message: nil, preferredStyle: .actionSheet)
        alert.addAction(getAction(title: "UIWebView", idController: "uiWebID"))
        alert.addAction(getAction(title: "WKWebView", idController: "wkWebID"))
        alert.addAction(getAction(title: "SFSafariView", idController: "sfWebID"))
        alert.addAction(getAction(title: "Cancel"))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getAction(title: String, idController: String? = nil) -> UIAlertAction {
        guard let idController = idController else {
            return UIAlertAction(title: title, style: .cancel)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let uiAction = UIAlertAction(title: title, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            guard var viewController = storyboard.instantiateViewController(withIdentifier: idController) as? WebProtocol else { return }
            viewController.getLink = self.model?.getURL()
            self.present(viewController as! UIViewController, animated: true)
        })
        return uiAction
    }
}

extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradient.locations = [0 , 1]
        self.layer.mask = gradient
    }
}
    
    

