//
//  DetailController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/16/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var animator = UIDynamicAnimator()
    
   // private let storyBoardID = "uiWebID"
    
    
    
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
        showTextButton.setTitle("More", for: .normal)
        openWikiButton.setTitle("OpenWiki", for: .normal)
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
            
//            // button down
//            animator = UIDynamicAnimator(referenceView: scrollView)
//            let gravity = UIGravityBehavior(items: [showTextButton])
//            animator.addBehavior(gravity)
//
//            // stop on view
//            let collision = UICollisionBehavior(items: [showTextButton])
//            collision.translatesReferenceBoundsIntoBoundary = true
//            animator.addBehavior(collision)
            
            
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
  
//            showTextButton.setTitle("Less", for: .normal)
//            constrainHeightViewToSuperView.priority = UILayoutPriority.defaultLow
//            constrainBottomTopToView.priority = UILayoutPriority.defaultLow
//            viewForOpacity.isHidden = true
//            isTextOpen = true
        } else {
            showTextButton.setTitle("More", for: .normal)
            
            //constrainHeightViewToSuperView.priority = UILayoutPriority.defaultHigh
            constrainHeightViewToSuperView.priority = UILayoutPriority(highPriority)
            constrainBottomTopToView.priority = UILayoutPriority(highPriority)
            viewForOpacity.isHidden = false
            isTextOpen = false
        }
    }
    
    
//    func presentView (storyBoardID: String, vcClass: String){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        var uiWebViewStoryBoard: UIViewController
//        switch vcClass {
//        case "UIWebViewVC":
//            guard let uiWebView = storyboard.instantiateViewController(withIdentifier: storyBoardID) as? UIWebViewVC else { return }
//        default:
//            return
//        }
//
//        uiWebViewStoryBoard.urlWikiString = self.model?.getURL()
//        self.navigationController?.present(uiWebViewStoryBoard, animated: true)
//    }
    
    
    
    
    @IBAction func openWikiButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Action Sheet", message: "Choose browser", preferredStyle: .actionSheet)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let uiWebView = UIAlertAction(title: "UIWebView", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            guard let uiWebViewStoryBoard = storyboard.instantiateViewController(withIdentifier: "uiWebID") as? UIWebVC else { return }
            uiWebViewStoryBoard.urlWikiString = self.model?.getURL()
            self.navigationController?.present(uiWebViewStoryBoard, animated: true)
            
        })
        
        let wkWebView = UIAlertAction(title: "WKWebView", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            guard let uiWebViewStoryBoard = storyboard.instantiateViewController(withIdentifier: "wkWebID") as? WKWebVC else { return }
            uiWebViewStoryBoard.urlWikiString = self.model?.getURL()
            self.navigationController?.present(uiWebViewStoryBoard, animated: true)

        })
        
        let sfSafariView = UIAlertAction(title: "SFSafariView", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            guard let uiWebViewStoryBoard = storyboard.instantiateViewController(withIdentifier: "sfWebID") as? SFSafariVC else { return }
            uiWebViewStoryBoard.urlWikiString = self.model?.getURL()
            self.navigationController?.present(uiWebViewStoryBoard, animated: true)

        })
        
        let canselAction = UIAlertAction(title: "Cansel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        
        alert.addAction(uiWebView)
        alert.addAction(wkWebView)
        alert.addAction(sfSafariView)
        alert.addAction(canselAction)
        
        
//        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//            NSLog("The \"OK\" alert occured.")
//        }))
     
        self.present(alert, animated: true, completion: nil)
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
    
    

