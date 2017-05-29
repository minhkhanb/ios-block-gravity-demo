//
//  ViewController.swift
//  BlockGravityDemo
//
//  Created by john on 5/22/17.
//  Copyright © 2017 toicodedoec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var push: UIPushBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let img: UIImage = UIImage(named: "spaceship")!
        let imgView = UIImageView(image: img)
        view.addSubview(imgView)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [imgView])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [imgView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        push = UIPushBehavior(items: [], mode: .continuous)
        push.pushDirection = CGVector(dx: 0, dy: -1)
        animator.addBehavior(push)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func btnReplay(_ sender: UIButton) {
        view.subviews.forEach { $0.removeFromSuperview() }
        viewDidLoad()
    }
    
    @IBAction func fire(_ sender: UITapGestureRecognizer) {
        let rocketView = UIImageView(image: UIImage(named: "rocket"))
        let location = sender.location(in: view)
        rocketView.frame.origin.x = location.x
        rocketView.frame.origin.y = location.y
        view.addSubview(rocketView)
        
        push.addItem(rocketView)
    }

}

