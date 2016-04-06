//
//  ViewController.swift
//  BullEye
//
//  Created by Rachel Goff on 3/19/16.
//  Copyright © 2016 Rachel Goff. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var roundLable: UILabel!
    
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 20
        slider.value = Float (currentValue)
        round += 1
    }
    
    func startNewGame (){
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLables(){
        targetLable.text = String(targetValue)
        scoreLable.text = String(score)
        roundLable.text = String(round)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        startNewGame()
        updateLables()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named:"SliderTrackLeft"){
        
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight"){
            
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        //var difference: Int
        /*if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }*/
        
       /* difference = targetValue - currentValue
        if difference < 0 {
            difference = difference * (-1)
        }*/
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect! You win 100 bonus points!"
            points += 100
        } else if difference < 5  {
            title = "Great!"
            if difference == 1 {
                points += 50}
        } else {
            title = "You can do it!"
        }
        score += points
        
        let message = "The value of the slider is: \(currentValue)" + "\n The target value is \(targetValue)" + "\n The difference is: \(difference)" + "\n Your score is: \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
       // let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in
            self.startNewRound()
            self.updateLables()
        })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
       // startNewRound()
        // updateLables()
        
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        //print("The value of the slider is now:\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver (){
        startNewGame()
        updateLables()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
    
}

