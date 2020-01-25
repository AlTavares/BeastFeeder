//
//  File.swift
//
//
//  Created by Alexandre Mantovani Tavares on 25/01/20.
//

import Foundation
import SwiftyGPIO
import SG90Servo

class Servo {
    func test() {
        guard let pwms = SwiftyGPIO.hardwarePWMs(for: .RaspberryPiPlusZero) else { return }
        let pwm = (pwms[0]?[.P18])!

        let s1 = SG90Servo(pwm)
        s1.enable()
        s1.move(to: .left)
        sleep(1)
        s1.move(to: .middle)
        sleep(1)
        s1.move(to: .right)
        sleep(1)

        s1.disable()
    }
}
