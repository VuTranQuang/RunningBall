//
//  ViewController.swift
//  RunningBall
//
//  Created by RTC-HN154 on 10/1/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var ball1 = UIImageView()
    var ball2 = UIImageView()
    var radians = CGFloat()
    var radians1 = CGFloat()
    var radians2 = CGFloat()
    var ballRadious = CGFloat()
    
    var isReserd = true
    var isReserd1 = true
    var isReserd2 = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        _ = Timer.scheduledTimer(timeInterval: 0.015, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.008, target: self, selector: #selector(rollBall1), userInfo: nil, repeats: true)
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(rollBall2), userInfo: nil, repeats: true)
    }
    func addBall() {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball"))
        ball1 = UIImageView(image: UIImage(named: "ball1"))
        ball2 = UIImageView(image: UIImage(named: "ball2"))
        
        ballRadious = 32
        ball.center = CGPoint(x: ballRadious, y: mainViewSize.height * 0.5)
        ball1.center = CGPoint(x: mainViewSize.width - ballRadious, y: mainViewSize.height - 100)
        ball2.center = CGPoint(x: mainViewSize.width - ballRadious, y: 100)
        self.view.addSubview(ball)
        self.view.addSubview(ball1)
        self.view.addSubview(ball2)
    }
    @objc
    func rollBall() {
        if isReserd {
            let deltaAngle: CGFloat = 0.1
            radians = radians + deltaAngle
            ball.transform = CGAffineTransform.init(rotationAngle: radians)
            ball.center = CGPoint(x: ball.center.x + ballRadious * deltaAngle, y: ball.center.y)
            if ball.center.x + ballRadious >= self.view.bounds.width {
                isReserd = false
            }
            
        } else {
            let deltaAngle: CGFloat = -0.1
            radians = radians + deltaAngle
            ball.transform = CGAffineTransform.init(rotationAngle: radians)
            ball.center = CGPoint(x: ball.center.x + (ballRadious * deltaAngle) , y: ball.center.y)
            if ball.center.x <= ballRadious {
                isReserd = true
            }
        }
    }
    
    @objc
    func rollBall1() {
        if isReserd1 {
            let deltaAngle: CGFloat = -0.1
            radians1 = radians1 + deltaAngle
            ball1.transform = CGAffineTransform.init(rotationAngle: radians1)
            ball1.center = CGPoint(x: ball1.center.x + (ballRadious * deltaAngle) , y: ball1.center.y)
            if ball1.center.x <= ballRadious {
                isReserd1 = false
            }
            
        } else {
            let deltaAngle: CGFloat = 0.1
            radians1 = radians1 + deltaAngle
            ball1.transform = CGAffineTransform.init(rotationAngle: radians1)
            ball1.center = CGPoint(x: ball1.center.x + ballRadious * deltaAngle, y: ball1.center.y)
            
            if ball1.center.x + ballRadious >= self.view.bounds.width {
                isReserd1 = true
            }
        }
    }
    @objc
    func rollBall2() {
        if isReserd2 {
            let deltaAngle: CGFloat = -0.1
            radians2 = radians2 + deltaAngle
            ball2.transform = CGAffineTransform.init(rotationAngle: radians2)
            ball2.center = CGPoint(x: ball2.center.x + (ballRadious * deltaAngle) , y: ball2.center.y)
            if ball2.center.x  <= ballRadious {
                isReserd2 = false
            }
            
            
        } else {
            let deltaAngle: CGFloat = 0.1
            radians2 = radians2 + deltaAngle
            ball2.transform = CGAffineTransform.init(rotationAngle: radians2)
            ball2.center = CGPoint(x: ball2.center.x + ballRadious * deltaAngle, y: ball2.center.y)
            
            if ball2.center.x + ballRadious >= self.view.bounds.width {
                isReserd2 = true
            }
        }
    }
    
    
}

