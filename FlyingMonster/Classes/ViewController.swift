//
//  ViewController.swift
//  FlyingMonster
//
//  Created by charleslin826 on 12/27/2018.
//  Copyright (c) 2018 charleslin826. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var monster: UIImageView!
    var rocket: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var random = 6.arc4random
        if  random < 1 {
            random = 6
        }
        monster = UIImageView(frame: CGRect(x: self.view.frame.width / 1.1, y: self.view.frame.height / 1.1 , width: self.view.frame.width / 7.5 , height: self.view.frame.height / 15 ))
        monster.image = UIImage(named: "怪獸\(random).png")
        self.view.addSubview(self.monster)
        
        rocket = UIImageView(frame: CGRect(x: self.view.frame.width / 2 - (self.view.frame.width / 7.5), y: self.view.frame.height / 1.1 , width:
            self.view.frame.width / 7 , height: self.view.frame.height / 12 ))
        rocket.image = UIImage(named: "rocket.png")
        self.view.addSubview(self.rocket)
        
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.monster.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.monster.center = CGPoint(x: self.view.frame.width / 2 , y:  self.view.frame.height / 2)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.monster.transform = CGAffineTransform(rotationAngle: CGFloat.pi )
                self.rocket.center = CGPoint(x: self.view.frame.width / 2 , y:   self.view.frame.height / 2)
                //                self.soccer.transform = CGAffineTransform(rotationAngle: CGFloat.pi )
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.monster.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.monster.center = CGPoint(x:  0 - (self.view.frame.width / 7.5), y: 0 - (self.view.frame.height / 15)  )
                self.rocket.center = CGPoint(x: self.view.frame.width / 2 , y:  -100)
                //                self.soccer.transform = CGAffineTransform(rotationAngle: 180 )
                self.rocket.transform = CGAffineTransform(scaleX: 3, y: 3)
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.monster.isHidden = true
            self.rocket.isHidden = true
        }
        
    }
    
    
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}




