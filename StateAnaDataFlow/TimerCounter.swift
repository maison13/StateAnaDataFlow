//
//  TimerCounter.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import Foundation
import Combine

final class TimerCounter: ObservableObject {
    
    var counter = 3
    var buttonTitle = "Start"
    var disableButton = false
       
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapper()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
            disableButton.toggle()
        }
        
        objectWillChange.send()
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapper() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
            
        } else {
            buttonTitle = "Wait..."
            disableButton.toggle()
        }
        
        objectWillChange.send()
    }
}
