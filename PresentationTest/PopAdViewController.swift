//
//  PopAdViewController.swift
//  PresentationTest
//
//  Created by Minxin Guo on 5/5/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

import UIKit

class PopAdViewController: UIViewController {
    
    private var closeButton : UIButton = UIButton()
    private var imageView : UIImageView = UIImageView()
    private var containerView: UIView = UIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.6)
        containerView.layer.cornerRadius = 5.0
        self.view.addSubview(containerView)
        
        let bodyFontSize: CGFloat = view.bounds.size.width > 667.0 ? 20.0 : 16.0
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", forState: .Normal)
        closeButton.layer.cornerRadius = 5.0
        closeButton.titleLabel!.font = UIFont.systemFontOfSize(bodyFontSize)
        closeButton.backgroundColor = UIColor(red: 116.0/255, green:190.0/255, blue:42.0/255, alpha:1.0)
        closeButton.addTarget(self, action: #selector(close(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(closeButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        
        let views: [String : AnyObject] = ["containerView" : containerView, "closeButton" : closeButton, "imageView" : imageView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[containerView]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[containerView]|", options: [], metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[imageView(300@250)]-|", options: [], metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[closeButton(100@750)]-50-|", options: [.AlignAllCenterY], metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[imageView]-20-[closeButton(40)]-|", options: [.AlignAllCenterX], metrics: nil, views: views))
    }
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }
    
    func close(sender: UIButton) {
        presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
