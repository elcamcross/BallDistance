//
//  BallAnimation.swift
//  Ball Distance V1.0
//
//  Created by Cam Cross on 12/28/18.
//  Copyright © 2018 Cam Cross. All rights reserved.
//

import SpriteKit
import AVFoundation

let start = CGPoint(x: 100, y: 50)
let end = CGPoint(x: 200, y: 50)
let control = CGPoint(x: 150, y: 100)
var motion: SKAction = SKAction()

let radius: CGFloat = 20;
let bounds = CGRect(x: 0, y: 0, width: 400, height: 200)
let skview = SKView(frame: bounds)

class MyScene: SKScene,AVSpeechSynthesizerDelegate
{
    var motionComplete = false
    var redline: SKShapeNode = SKShapeNode()
    var greenball: SKShapeNode = SKShapeNode()
    override func sceneDidLoad()
    {
        greenball = SKShapeNode(circleOfRadius: radius)
        greenball.position = start
        greenball.fillColor = .green
        
        let motionpath = CGMutablePath()
        
        motionpath.move(to: start)
        motionpath.addQuadCurve(to: end, control: control)
        
        motion = SKAction.follow(motionpath, asOffset: false, orientToPath: true,duration: 2)
        
        let linepath = CGMutablePath()
        linepath.move(to: start)
        redline = SKShapeNode(path: linepath)
        redline.strokeColor = .red
        redline.lineWidth = 5
        
        greenball.run(motion)
        {
            self.motionComplete = true
        }
        
        self.addChild(greenball)
        self.addChild(redline)
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        if (motionComplete == false)
        {
            let cgpath = self.redline.path as! CGMutablePath;
            cgpath.addLine(to: greenball.position)
            self.redline.path = cgpath
        }
    }
}
