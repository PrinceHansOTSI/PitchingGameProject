//
//  halfInning.swift
//  pitchingGameProject
//
//  Created by MacLab09 on 3/29/16.
//  Copyright © 2016 MacLab09. All rights reserved.
//

import Foundation


class halfInning{
    
    var strikes: Int
    var balls: Int
    var outs: Int
    
    init()
    {
        strikes = 0
        balls = 0
        outs = 0
        
    }
    
    func increaseStrikes()
    {
        strikes = strikes + 1
    }
    func increaseBalls()
    {
        balls = balls + 1
    }
    
    
    
    func increaseOuts()
    {
        outs = outs + 1
    }
    
    func resetBallStrikeCount()
    {
        strikes = 0
        balls = 0
    }
    
    
    func atBatResult()
    {
        //what animation will happen when a hit or homerun or strikeout occurs
    }
    
    func getNextBatterUp()
    {
        //conclude the results of the last at bat and summon the next batter in the lineup 
        //if there are still outs to be outted (less than 3 still)
    }
    
    deinit{
    }
    
    func endTheInningFunc()
    {
        
    }
    
}
    
    // reset balls, strikes, outs to 0
    // reverse which team is batting, which is pitching
    
    
    //touches began func to start the pitch delivery
         
    
    
    
    
    //touches ended func to complete the pitch delivery (Bulk of code?)
    
    
    
    //func pitchEvent to process the data from ended to determine how global variables are effected
    //
    
    
    
    
    
    
    
    
