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
    
    var balls: Int = 0
    var strikes: Int = 0
    var outs: Int = 0
    
    @IBOutlet weak var ballsTallyLabel: UILabel!
    @IBOutlet weak var strikesTallyLabel: UILabel!
    @IBOutlet weak var outsTallyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var valueFromFirstVC: Int!
//    
//        z1tapGestureRecognizer.addTarget(self, action: "tapFunction")
//        zone1Label.addGestureRecognizer(z1tapGestureRecognizer)
//        zone1Label.userInteractionEnabled = true
        
    
        ballsTallyLabel.text = String(balls)
        strikesTallyLabel.text = String(strikes)

    
}


//    func tapFunction()
//    {
//        print("tap. strike!")
//        
//        //make the label BIGGER
//    }
//   
   
    
    var startTouchPoint: CGPoint!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        startTouchPoint = (touches.first! as UITouch).locationInView(view)
        print("touchpoint x: ",startTouchPoint!.x,"touchpoint y: ",startTouchPoint!.y)
        print(zone1Label.frame.contains(startTouchPoint)) //thank you

    
    }
    /************************************************************* END TOUCH POINT IS ONLY NEEDED LATER, FOR CALCULATING PITCH MOVEMENT. DO IT LATER ********************************/
    var endTouchPoint: CGPoint!
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        let endTouchPoint = (touches.first! as UITouch).locationInView(view)
        //print("end touch point: ", endTouchPoint.x, endTouchPoint.y)
        
        if startTouchPoint != nil
        {
            
            
            if zone1Label.frame.contains(startTouchPoint) == true
            {
                print(strikes)
                strikes = strikes++
                print(strikes)
            }
            else
            {
                balls = balls++
            }
            
        }
        ballsTallyLabel.text = String(balls)
        strikesTallyLabel.text = String(strikes)

        print(zone1Label.frame.contains(endTouchPoint)) //thank you
    }
    /********************
     *****************************************/
 
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
