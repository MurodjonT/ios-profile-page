//
//  ViewAnimationView.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 29/11/24.
//

import UIKit

final class ViewAnimation: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Animation
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch: UITouch = touches.first else { return }
        
        let location = touch.location(in: self)
        if frame.contains(location) {
            animateFor(isHighlighted: true)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animateFor(isHighlighted: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animateFor(isHighlighted: false)
    }
    
    
    fileprivate func animateFor(isHighlighted: Bool, completion: ((Bool) -> Void)? = nil) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        if isHighlighted {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0,
                options: animationOptions, animations: { [weak self] in
//                    self.transform = .init(scaleX: 1.5, y: 1.5)
                    self?.alpha = 0.5
            }, completion: completion)
        } else {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0,
                options: animationOptions, animations: { [weak self] in
//                    self.transform = .identity
                    self?.alpha = 1.0
            }, completion: completion)
        }
    }
}
