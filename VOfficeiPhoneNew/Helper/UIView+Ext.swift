//
//  UIView+Ext.swift
//  Life
//
//  Created by Duc Minh Nguyen on 8/20/21.
//

import UIKit
import RxSwift

extension CAKeyframeAnimation {
    static func horizontalShake(numberOfShake: Int, vigour: CGFloat, duration: CFTimeInterval) -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.duration = duration
        animation.isAdditive = true
        
        var values = [CGFloat]()
        var keyTimes = [CGFloat]()
        values.append(0.0)
        keyTimes.append(0.0)
        for index in 1 ..< numberOfShake {
            values.append(vigour * (index % 2 == 0 ? 1 : -1) )
            keyTimes.append(CGFloat(index) * 1.0 / CGFloat(numberOfShake))
        }
        values.append(0.0)
        keyTimes.append(1.0)
        
        animation.values = values
        animation.keyTimes = keyTimes as [NSNumber]
        
        return animation
    }
}

extension UIView {
    func shake(completion: (() -> Void)? = nil) {
        let duration = 0.6
        let animation = CAKeyframeAnimation.horizontalShake(numberOfShake: 9, vigour: 3, duration: duration)
        layer.add(animation, forKey: "shake")
        if let completion = completion {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: completion)
        }
    }
}

extension CALayer {
    @discardableResult
    func addShadow() -> CALayer {
        shadowOffset = .zero
        shadowOpacity = 0.1
        shadowRadius = 20
        shadowColor = UIColor.black.cgColor
        masksToBounds = false
        return self
    }
}

extension UIControl {
    func addAction(for controlEvent: UIControl.Event, _ action: @escaping () -> Void) {
        if #available(iOS 14.0, *) {
            self.addAction(.init(handler: { _ in action() }), for: controlEvent)
        } else {
            @objc class ClosureSleeve: NSObject {
                let closure: () -> Void
                init(_ closure: @escaping () -> Void) { self.closure = closure }
                @objc func invoke() { closure() }
            }
            let sleeve = ClosureSleeve(action)
            addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvent)
            objc_setAssociatedObject(self, UUID().uuidString, sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}