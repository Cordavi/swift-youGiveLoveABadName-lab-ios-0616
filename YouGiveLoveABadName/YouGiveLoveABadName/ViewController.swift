//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var bonJoviImage: UIImageView!
   @IBOutlet weak var shrinkExpandButton: UIButton!
   
   var shrinkBonJoviHeight: NSLayoutConstraint?
   var enlargeBonJoviHeight: NSLayoutConstraint?
   //   var bigBonJoviHeight: NSLayoutConstraint?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      shrinkExpandButton.tag = 1000
      // Do any additional setup after loading the view, typically from a nib.
   }
   
   @IBAction func expandButtonTapped(sender: AnyObject) {
      
      if sender.tag == 1000 {
         UIView.animateKeyframesWithDuration(0.5, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3.0, animations: {
               self.shrinkBonJoviHeight = self.bonJoviImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3)
               self.shrinkBonJoviHeight?.active = true
               self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(1/3.0, relativeDuration: 1/3.0, animations: {
               self.shrinkBonJoviHeight?.active = false
               self.enlargeBonJoviHeight = self.bonJoviImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.1)
               self.enlargeBonJoviHeight?.active = true
               self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(2/3.0, relativeDuration: 1/3.0, animations: {
               self.enlargeBonJoviHeight?.active = false
               self.bonJoviImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.0).active = true
               self.view.layoutIfNeeded()
            })
            }, completion: {(true) in
               self.shrinkExpandButton.tag = 1001
         })
      } else if sender.tag == 1001 {
         UIView.animateKeyframesWithDuration(0.5, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3.0, animations: {
               self.enlargeBonJoviHeight = self.bonJoviImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.1)
               self.enlargeBonJoviHeight?.active = true
            })
            
            UIView.addKeyframeWithRelativeStartTime(1/3.0, relativeDuration: 1/3.0, animations: {
               self.enlargeBonJoviHeight?.active = false
               self.shrinkBonJoviHeight = self.bonJoviImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3)
               self.shrinkBonJoviHeight?.active = true
               self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(2/3.0, relativeDuration: 1/3.0, animations: {
               self.shrinkBonJoviHeight?.active = false
               self.enlargeBonJoviHeight?.active = false
               self.bonJoviImage.heightAnchor.constraintEqualToAnchor(self.bonJoviImage.heightAnchor, multiplier: 1.0).active = true
               self.view.layoutIfNeeded()
            })
            }, completion: {_ in
               self.shrinkExpandButton.tag = 1000
         })
      }
   }
   
}

