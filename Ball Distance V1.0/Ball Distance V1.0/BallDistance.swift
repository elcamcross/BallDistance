//
//  BallDistance.swift
//  Ball Distance V1.0
//
//  Created by Cam Cross on 12/28/18.
//  Copyright © 2018 Cam Cross. All rights reserved.
//

import UIKit

public class Ball
{
    var typeOfBall :String
    var weight :Double
    var ballVelocity :Double
    
    init(inputVelocity :Double, inputTypeOfBall :String)
    {
        self.ballVelocity = inputVelocity
        self.typeOfBall = inputTypeOfBall
        
        if (typeOfBall == "baseball"){
            self.weight = 145.29
        }
        else if (typeOfBall == "softball"){
            self.weight = 187.5
        }
        else{
            self.weight = 0.0
            print("Enter a valid ball type")
        }
    }
    
    func getPitchSpeed() -> Double
    {
        return ballVelocity
    }
    
    func getBallType() -> String
    {
        return typeOfBall
    }
    
    func getBallWeight() -> Double
    {
        return weight
    }
}

public class Bat
{
    var length :Double
    var weight :Double
    var typeOfBat :String
    var swingVelocity :Double
    
    init(inputLength :Double, inputWeight :Double, inputTypeOfBat :String, inputSwingVelocity :Double)
    {
        self.length = inputLength
        self.weight = inputWeight
        self.typeOfBat = inputTypeOfBat
        self.swingVelocity = inputSwingVelocity
    }
    
    func getSwingVelocity() -> Double
    {
        return swingVelocity
    }
    
    func getBatLength() -> Double
    {
        return length
    }
    
    func getBatWeight() -> Double
    {
        return weight
    }
    
    func getBatType() -> String
    {
        return typeOfBat
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

public class Contact
{
    var exitVelo :Double
    var exitVeloConstant :Double
    
    init(batType :String, pitchVelo :Double, swingVelo :Double)
    {
        if (batType == "wood" || batType == "Wood")
        {
            self.exitVeloConstant = 0.1
            print("velo constant .1")
        }
            
        else if (batType == "metal" || batType == "Metal")
        {
            self.exitVeloConstant = 0.3
            print("velo constant .3")
        }
        else
        {
            self.exitVeloConstant = 0
            print("Enter valid bat type")
        }
        self.exitVelo = (self.exitVeloConstant * pitchVelo) + ((1 + self.exitVeloConstant) * swingVelo)
    }
    
    func getExitVelocity() -> Double
    {
        return exitVelo
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

var bat = Bat(inputLength: 32.0, inputWeight: 50.0, inputTypeOfBat: "wood", inputSwingVelocity: 75)

var ball = Ball(inputVelocity: 90, inputTypeOfBall: "baseball")

//angle in radians
var angle = launchAngle(inputAngle: 0.5)

var contact = Contact(batType: bat.getBatType(), pitchVelo: ball.getPitchSpeed(), swingVelo: bat.getSwingVelocity())

var time = hitTime(exitVelocity: contact.getExitVelocity(), angle: angle.getAngle())

var distance = Distance(hitTime: time.getTime(), exitVelo: contact.getExitVelocity(), angle: angle.getAngle())

var distanceTraveled = distance.getDistance()

print(distanceTraveled)
