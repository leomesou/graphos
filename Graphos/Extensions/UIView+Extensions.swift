//
//  UIView+Extensions.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

extension UIView {

	public func roundCorners(_ radius: CGFloat = 8.0) {
		layer.cornerRadius = radius
		layer.masksToBounds = true
	}

	public func roundView() {
		layer.cornerRadius = frame.height / 2.0
		layer.masksToBounds = true
	}

	public func addBorder(_ width: CGFloat = 2.0, color: UIColor = .lightGray) {
		layer.borderWidth = width
		layer.borderColor = color.cgColor
	}

	public func addShadow() {
		let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius)
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 3, height: 3)
		layer.shadowOpacity = 0.5
		layer.masksToBounds = false
		layer.shadowPath = shadowPath.cgPath
	}

	public func addGradient(color1: UIColor, color2: UIColor) {
		let gradient = CAGradientLayer()
		gradient.colors = [color1, color2]
		gradient.frame = CGRect(origin: CGPoint.zero, size: frame.size)
		layer.insertSublayer(gradient, at: 0)
	}

	public func fadeIn(_ duration: TimeInterval = 0.1, delay: TimeInterval = 0.0, maxAlpha: CGFloat = 1.0) {
		self.isHidden = false
		UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
			self.alpha = maxAlpha
		}, completion: nil)
	}

	public func fadeOut(_ duration: TimeInterval = 0.1, delay: TimeInterval = 0.0) {
		UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
			self.alpha = 0.0
		}, completion: { _ in
			self.isHidden = true
		})
	}
}
