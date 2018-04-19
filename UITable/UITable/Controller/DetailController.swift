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

    let highPriority = Float(999)
    var isTextOpen = false
    var model: EntityProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = model?.getDescr()
        self.title = model?.getName()
        showTextButton.setTitle("More", for: .normal)
        viewForOpacity.opacityGradient()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {

        if !isTextOpen {
            showTextButton.setTitle("Less", for: .normal)
            constrainHeightViewToSuperView.priority = UILayoutPriority.defaultLow
            constrainBottomTopToView.priority = UILayoutPriority.defaultLow
            viewForOpacity.isHidden = true
            isTextOpen = true
        } else {
            showTextButton.setTitle("More", for: .normal)
            
            //constrainHeightViewToSuperView.priority = UILayoutPriority.defaultHigh
            constrainHeightViewToSuperView.priority = UILayoutPriority(highPriority)
            constrainBottomTopToView.priority = UILayoutPriority(highPriority)
            viewForOpacity.isHidden = false
            isTextOpen = false
        }
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
    
    

