//
//  ViewController.swift
//  PresentationTest
//
//  Created by Minxin Guo on 5/4/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let testTransitioningDelegate = PopAdTransitioningDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test() {
        transitioningDelegate = testTransitioningDelegate
        
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        transitioningDelegate = testTransitioningDelegate
        let vc = PopAdViewController()
        vc.setImage(UIImage(named: "test")!)
        vc.transitioningDelegate = testTransitioningDelegate
        presentViewController(vc, animated: true, completion: nil)
    }
}

