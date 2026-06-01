//
//  AnimationSpeedBooster.swift
//
//  Created by Jan de Vries on 20/05/2026.
//

import UIKit

/// Convenience class for changing speed of animations throughout your app, like page transitions and keyboard slide animation.
/// Use `AnimationSpeedBooster.🚀` to set animation speed factor.
/// Use `AnimationSpeedBooster.🚨` to set typing indicator blink speed factor.
@objc public class AnimationSpeedBooster: NSObject {
       
    /// Changes speed of animations throughout your app, like page transitions and keyboard slide animation. Use 1.0 for regular speed, 2.0 for double speed and so on, or 0.0 to disable animations entirely.
    @objc public static var 🚀: Float {
        set {
            guard AnimationSpeedBooster.shared.animationSpeed != newValue else { return }
            AnimationSpeedBooster.shared.animationSpeed = Float.greatestFiniteMagnitude // this will cancel any current animations
            DispatchQueue.main.async() {
                AnimationSpeedBooster.shared.animationSpeed = newValue > 0 ? newValue : Float.greatestFiniteMagnitude
            }
        }
        get {
            AnimationSpeedBooster.shared.animationSpeed
        }
    }
    
    /// Changes typing indicator blink speed for all TextFields and TextViews. Use 1.0 for regular speed, 2.0 for double speed and so on, or 0.0 to disable blinking entirely.
    @objc public static var 🚨: Float {
        set {
            DispatchQueue.main.async() {
                AnimationSpeedBooster.shared.blinkSpeed = newValue > 0 ? newValue : Float.greatestFiniteMagnitude
            }
        }
        get {
            AnimationSpeedBooster.shared.blinkSpeed
        }
    }
    
    nonisolated(unsafe) fileprivate static let shared = AnimationSpeedBooster()
    
    fileprivate var animationSpeed: Float = 1.0 {
        didSet {
            NotificationCenter.asb.post(name: UIWindow.updateSpeedNotification, object: nil)
        }
    }
    
    fileprivate var blinkSpeed: Float = 1.0 {
        didSet {
            NotificationCenter.asb.post(name: UIWindow.updateSpeedNotification, object: nil)
        }
    }

    private override init() {
        super.init()
        // These listeners are used to detect usage of all Windows and TextField/TextViews
        // Once triggered an associated object is attached with a speed change listener
        NotificationCenter.default.addObserver(self, selector: #selector(setWindowAO), name: UIWindow.didBecomeVisibleNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setTextAO), name: UITextView.textDidBeginEditingNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setTextAO), name: UITextField.textDidBeginEditingNotification, object: nil)
    }
    
    @objc func setWindowAO(notification: NSNotification) {
        if let window = notification.object as? UIWindow,
           window.window == nil
        {
            if window.ao == nil {
                window.ao = UIWindow.AssociatedObject()
                window.ao?.window = window
                window.ao?.updateSpeed()
            }
        }
    }
    
    @objc func setTextAO(notification: NSNotification) {
        if let view = notification.object as? UIView,
            view is UITextField || view is UITextView // just in case
        {
            if view.ao == nil {
                view.ao = UIView.AssociatedObject()
                view.ao?.textViewField = view
            }
            view.ao?.updateSpeed()
        }
    }
}


fileprivate extension NotificationCenter {
    static let asb = NotificationCenter()
}

fileprivate extension UIView {
    
    static let updateSpeedNotification = Notification.Name("updateSpeed")

    var ao: AssociatedObject? {
        set {
            objc_setAssociatedObject(self, &AssociatedObject.key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            objc_getAssociatedObject(self, &AssociatedObject.key) as? AssociatedObject
        }
    }
    
    class AssociatedObject {
        
        nonisolated(unsafe) static var key = malloc(1)!
        
        weak var window: UIWindow? {
            didSet {
                setObservers()
            }
        }
        
        weak var textViewField: UIView? {
            didSet {
                setObservers()
            }
        }
        
        var hasSetObservers = false
        func setObservers() {
            guard !hasSetObservers else { return }
            hasSetObservers = true
            NotificationCenter.asb.addObserver(self, selector: #selector(updateSpeed), name: UIWindow.updateSpeedNotification, object: nil)
        }

        @objc fileprivate func updateSpeed() {
            if let window, window.window == nil {
                window.layer.speed = AnimationSpeedBooster.shared.animationSpeed
            }
            if let textViewField {
                let blinkSpeed = (1.0/(textViewField.window?.layer.speed ?? 1.0)) * AnimationSpeedBooster.shared.blinkSpeed
                if textViewField.layer.speed != blinkSpeed {
                    textViewField.layer.speed = blinkSpeed
                    if textViewField.isFirstResponder {
                        if let textField = textViewField as? UITextField {
                            // triggers blink reset
                            textField.attributedText = textField.attributedText
                        }
                        else if let textView = textViewField as? UITextView {
                            // triggers blink reset
                            textView.selectedRange = textView.selectedRange
                        }
                    }
                }
            }
        }
        
        deinit {
            NotificationCenter.asb.removeObserver(self) // just in case
        }
    }
}
