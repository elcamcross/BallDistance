//
//  FirstViewController.swift
//  Ball Distance V1.0
//
//  Created by Cam Cross on 12/28/18.
//  Copyright © 2018 Cam Cross. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

public class launchAngle
{
    var angle :Double
    
    init(inputAngle :Double)
    {
        self.angle = inputAngle
    }
    
    func getAngle() -> Double
    {
        return angle
    }
    
}

public class hitTime
{
    var time :Double
    
    init(exitVelocity :Double, angle :Double)
    {
        //test efficacy of "let" statement, may stay constant for every instance.
        let sinus = sin(angle)
        let radicand = -2 * (3.5 * exitVelocity * sinus)/(-21.94)
        
        self.time = radicand.squareRoot()
    }
    
    func getTime() -> Double
    {
        return time
    }
    
}

public class Distance
{
    var distance :Double
    var xVelocity :Double
    
    init(hitTime :Double, exitVelo :Double, angle :Double)
    {
        xVelocity = exitVelo * cos(angle)
        distance = hitTime * xVelocity
    }
    
    func getDistance() -> Double
    {
        return distance
    }
    
}

//user will provide exitVelo
var exitVelo = 80.0

//user will provide launch angle in radians
var angle = launchAngle(inputAngle: 0.5)

var time = hitTime(exitVelocity: exitVelo, angle: angle.getAngle())

var distance = Distance(hitTime: time.getTime(), exitVelo: exitVelo, angle: angle.getAngle())

var distanceTraveled = distance.getDistance()

