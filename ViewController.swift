//
//  ViewController.swift
//  pitchingGameProject
//
//  Created by MacLab09 on 3/29/16.
//  Copyright © 2016 MacLab09. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
            //aks if user has existing game
            //load old game, if so
            //transition to new vc to continue playing
            // if there is no existing game
            //ask for user name, throwing arm, gameType etc.
            //transition to new VC for the game
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
//        let  fieldVal = Int(text1Field.text!)!
//        if segue.identifier == "playBallSegue"
//        {
//            let gamePlayVC = segue.destinationViewController as! GameController
//            
//
//            }
//
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    
    }


}

