//
//  GameController.swift
//  pitchingGameProject
//
//  Created by MacLab09 on 3/30/16.
//  Copyright © 2016 MacLab09. All rights reserved.
//

import UIKit

class GameController: UIViewController {

    let z1tapGestureRecognizer = UITapGestureRecognizer()
    @IBOutlet weak var zone1Label: UILabel!
    
   // var inningLog: Array = [halfInning]()
    var inningLog: [halfInning] = []
    
    var balls: Int = 0
    var strikes: Int = 0
    var outs: Int = 0
    
    @IBOutlet weak var ballsTallyLabel: UILabel!
    @IBOutlet weak var strikesTallyLabel: UILabel!
    @IBOutlet weak var outsTallyLabel: UILabel!
    @IBOutlet weak var presultLabel: UILabel!
    
    @IBAction func nextBatterButton(sender: AnyObject) {
       
        
        thisHalfInning.increaseOuts()
        outsTallyLabel.text = String(thisHalfInning.outs)
        //thisHalfInning.getNextBatter()
    }
    var thisHalfInning = halfInning()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var valueFromFirstVC: Int!
        print(thisHalfInning.strikes)
       
        
      
//    
//        z1tapGestureRecognizer.addTarget(self, action: "tapFunction")
//        zone1Label.addGestureRecognizer(z1tapGestureRecognizer)
//        zone1Label.userInteractionEnabled = true
        
    }


//    func tapFunction()
//    {
//        print("tap. strike!")
//        
//        //make the label BIGGER
//    }
   
   
    
    var startTouchPoint: CGPoint!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        startTouchPoint = (touches.first! as UITouch).locationInView(view)
        //print("touchpoint x: ",startTouchPoint!.x,"touchpoint y: ",startTouchPoint!.y)
        //print(zone1Label.frame.contains(startTouchPoint)) //thank you

    
    }
    /************************************************************* END TOUCH POINT FUNC IS ACTIALLY SUEPR IMPORTANT ********************************/
    var endTouchPoint: CGPoint!
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        let endTouchPoint = (touches.first! as UITouch).locationInView(view)
        //print("end touch point: ", endTouchPoint.x, endTouchPoint.y)
        
        strikesTallyLabel.text = String(thisHalfInning.strikes)
        ballsTallyLabel.text = String(thisHalfInning.balls)
        outsTallyLabel.text = String(thisHalfInning.outs)
        
        var Swing: Bool = false
        var Contact: Bool = false
        var Fair: Bool = false
        
        
        //so, is it a strike?
        if zone1Label.frame.contains(endTouchPoint) == true
        {
                   }
        //Definining a strike code copy and pasted from previous version of this same app Ive been building for months
        //ignoring pitch m ovement still, (and inaccuracy) we will assume balls are moving fast and straight
        //therefore, zone 1 = zone 2, meaning that where a ball is intended to be thrown is where it is actually thrown in the strike zone.
        
        if thisHalfInning.strikes < 2
        {
            //code will need to be modified to acocunt for situations where the ball is actually hit in play, which is a huge part of this sport, its how people score usually. resetting the ball and strike counts, adding a base runner,
            if zone1Label.frame.contains(endTouchPoint) == true
            {
                print("Strrrrike!");presultLabel.text = "Strike!!!"
                thisHalfInning.increaseStrikes()
                strikesTallyLabel.text = String(thisHalfInning.strikes)
            }
                
            else if Swing && !Contact
            {
                print("Swinging Strrrrike!"); presultLabel.text = "Strike! (Swinging)"
                thisHalfInning.increaseStrikes()
                
                strikesTallyLabel.text = String(thisHalfInning.strikes)
            }
            else if Contact && !Fair
            {
                thisHalfInning.increaseStrikes()
                print("fouled off. strike++")
                presultLabel.text = "fouled off. Strike."
                strikesTallyLabel.text = String(thisHalfInning.strikes)
            }
                //else if Contact is TRUE, and Fair is TRUE, then you got yourself a base hit. congrats, way to fuck that up. now minimize the damage and end the inning. reset balls and strikes, bring up the next batter()
            else
            {
                thisHalfInning.increaseBalls()
                presultLabel.text = "ball."
                ballsTallyLabel.text = String(thisHalfInning.balls)
            }
        }
        else if thisHalfInning.strikes == 2 // same as <2 strikes, but foul balls dont add a strike. 
        // added functions to tell half inning class to add an out if there is a K or something
        {
            if zone1Label.frame.contains(endTouchPoint) == true
            {
                print("Strrrrike out!");presultLabel.text = "Strikeout!!! (>|) thats a backwards K"
                //
                thisHalfInning.resetBallStrikeCount()
                thisHalfInning.increaseOuts()
               
            }
            else if Swing && !Contact
            {
                print("Swinging Strrrrike!"); presultLabel.text = "Strikeout! (K)"
                thisHalfInning.resetBallStrikeCount()
                //thisHalfInning.increaseOuts()
                //instead of calling the increase ouyts function 
                nextBatterButton.text = "Continue"
            }
            else if Swing && Contact && !Fair
            {
                thisHalfInning.increaseStrikes()
                print("foul. Go again.")
                presultLabel.text = "Still 2 strikes. We will do that again."
            }
            else
            {
                thisHalfInning.increaseBalls()
                presultLabel.text = "ball."
                ballsTallyLabel.text = String(thisHalfInning.balls)
            }
            
        }
            //thisHalfInning.endTheInningFunc()
        else if outs == 3
        {
            outs == 3
            strikes == 0
            balls == 0
            inningLog.append(thisHalfInning)
            thisHalfInning = halfInning()
        }

        
        
    // control balls strikes outs tally from here
        
    
    
    
    
    
    }
    /*************************************************************/
 
//    let strikeZoneRect = CGRect(x: 100, y: 100, width: 150, height: 400)
//    func CGRectContainsPoint(strikeZoneRect:CGRect, startTouchPoint: CGPoint) -> Bool{
//    
//    
////    struct CGSize { var width: CGFloat var height: CGFloat init() init(width(500): CGFloat, height(1000): CGFloat) }
////    struct strikeRect { var origin: CGPoint var size: CGSize init() init(origin origin: CGPoint, size 600: CGSize) }
////    let strikeZoneRect = CGRect(
////        origin: CGPoint(x: 300, y: 1000),
////        size: UIScreen.mainScreen().bounds.size
////    )
//    
//    
//    return true
//        print("strike!")
//    }
//
    func isItAStrike() -> Bool
    {
        if zone1Label.frame.contains(startTouchPoint) == true
        {
      return true
            
        }
        else
        {
            return false
        }
        
        
      
    }
    
    
    
    
    
    
    // call func touches Began from halfInning class
    //call func touches Ended from halfInning class
    //it will gather data between the 2 data CG points to determine the pitchType, original pitch placement, resulting pitch location,
    //the computer will determine whether to swing or not based on the count (balls/strikes) and the original placement position, (and maybe perceived speed)
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
