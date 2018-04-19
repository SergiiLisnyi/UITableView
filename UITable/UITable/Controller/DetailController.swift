//
//  DetailController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/16/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var viewForOpacity: UIView!
    
    
  //  @IBOutlet weak var constrainBottom33: NSLayoutConstraint!
    
    @IBOutlet weak var heightForViewO: NSLayoutConstraint!
    
    @IBOutlet weak var constrainLayout: NSLayoutConstraint!
    
    
    @IBOutlet weak var labelConstrainBottom: NSLayoutConstraint!
    
    
    @IBOutlet var mainView: UIView!
    
    let lowPriority = Float(250)
    let highPriority = Float(999)
    var textOpen = false
    var model: DataStructureProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = model?.getDescr()
        self.title = model?.getName()
        
        moreButton.setTitle("More", for: .normal)
        //moreButton.setTitle("Less", for: .selected)
        
       viewForOpacity.opacityGradient()
      // constrainBottom33.priority = UILayoutPriority(lowPriority)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {

        if textOpen == false {
            moreButton.setTitle("Less", for: .normal)
            constrainLayout.priority = UILayoutPriority(lowPriority)

        //    labelConstrainBottom.priority = UILayoutPriority(lowPriority)
            labelConstrainBottom.constant = 10
            
            viewForOpacity.isHidden = true
            textOpen = true
        } else {
            moreButton.setTitle("More", for: .normal)
            constrainLayout.priority = UILayoutPriority(highPriority)
            viewForOpacity.isHidden = false
            textOpen = false
            
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
    
    

