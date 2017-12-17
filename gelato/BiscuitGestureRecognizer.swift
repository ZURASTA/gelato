//
//  DeepPressGestureRecognizer.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/17.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import AudioToolbox
import UIKit.UIGestureRecognizerSubclass

class BiscuitGestureRecognizer: UIGestureRecognizer
{
    var vibrateOnDeepPress = true
    let threshold: CGFloat
    
    private var deepPressed: Bool = false
    
    required init(target: AnyObject?, action: Selector, threshold: CGFloat)
    {
        self.threshold = threshold
        
        super.init(target: target, action: action)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent)
    {
        if let touch = touches.first
        {
            handleTouch(touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent)
    {
        if let touch = touches.first
        {
            handleTouch(touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent)
    {
        super.touchesEnded(touches, with: event)
        
        state = deepPressed ? UIGestureRecognizerState.ended : UIGestureRecognizerState.failed
        
        deepPressed = false
    }
    
    private func handleTouch(_ touch: UITouch)
    {
        guard touch.force != 0 , touch.maximumPossibleForce != 0 else
        {
            return
        }
        
        if !deepPressed && (touch.force / touch.maximumPossibleForce) >= threshold
        {
            
            state = UIGestureRecognizerState.began
            
            if vibrateOnDeepPress
            {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
            
            deepPressed = true
        }
        else if deepPressed && (touch.force / touch.maximumPossibleForce) < threshold
        {
            state = UIGestureRecognizerState.ended
            
            deepPressed = false
        }
    }
}

// MARK: DeepPressable protocol extension

protocol BiscuitGesture
{
    var gestureRecognizers: [UIGestureRecognizer]? {get set}
    
    func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)
    func removeGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)
    
    func setDeepPressAction(target: AnyObject, action: Selector)
    func removeDeepPressAction()
}

extension BiscuitGesture
{
    func setDeepPressAction(target: AnyObject, action: Selector)
    {
        let deepPressGestureRecognizer = BiscuitGestureRecognizer(target: target, action: action, threshold: 0.5)
        
        self.addGestureRecognizer(deepPressGestureRecognizer)
    }
    
    func removeDeepPressAction()
    {
        guard let gestureRecognizers = gestureRecognizers else
        {
            return
        }
        
        for recogniser in gestureRecognizers where recogniser is BiscuitGestureRecognizer
        {
            removeGestureRecognizer(recogniser)
        }
    }
}
