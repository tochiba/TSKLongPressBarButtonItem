//
//  TSKLongPressBarButtonItem.swift
//  ToolBar
//
//  Created by 千葉 俊輝 on 2015/11/14.
//  Copyright © 2015年 Toshiki Chiba. All rights reserved.
//

import UIKit

protocol TSKLongPressBarButtonDelegate : class {
    func handleLongPressGesture(sender: AnyObject)
}

class TSKLongPressBarButtonItem: UIBarButtonItem, UIGestureRecognizerDelegate {
    private var recognizerState: UIGestureRecognizerState = .Possible // Default state
    weak var delegate: TSKLongPressBarButtonDelegate?
    
    func setLongTapGesture(allowableMovement: CGFloat, minimumPressDuration: CFTimeInterval,
        numberOfTapsRequired: Int, numberOfTouchesRequired: Int, state: UIGestureRecognizerState,
        buttonDelegate: TSKLongPressBarButtonDelegate?) {
        self.removeLongGesture()
        if let buttonView = self.valueForKey("view") {
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: "p_handleLongPressGesture:")
            longPressGesture.allowableMovement = allowableMovement
            longPressGesture.minimumPressDuration = minimumPressDuration
            longPressGesture.numberOfTapsRequired = numberOfTapsRequired
            longPressGesture.numberOfTouchesRequired = numberOfTouchesRequired
            longPressGesture.delegate = self
            buttonView.addGestureRecognizer(longPressGesture)
        }
        self.recognizerState = state
        self.delegate = buttonDelegate
    }
    
    func removeLongGesture() {
        // TODO: Refactor
        if let buttonView = self.valueForKey("view") {
            if let recognizerList: [UIGestureRecognizer] = buttonView.gestureRecognizers {
                for recognizer in recognizerList {
                    if recognizer.isKindOfClass(UILongPressGestureRecognizer) {
                        buttonView.removeGestureRecognizer(recognizer)
                    }
                }
            }
        }
    }
    
    func p_handleLongPressGesture(sender: UIGestureRecognizer) {
        if sender.state == self.recognizerState {
            self.delegate?.handleLongPressGesture(self)
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
