//
//  UIColor+Extensions.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

extension UIColor {

	public convenience init(hex: UInt32) {
		let red   = hex < 0xFFFFFF ? (hex & 0xFF0000) >> 16 : (hex & 0xFF000000) >> 24
		let green = hex < 0xFFFFFF ? (hex & 0x00FF00) >>  8 : (hex & 0x00FF0000) >> 16
		let blue  = hex < 0xFFFFFF ? (hex & 0x0000FF)       : (hex & 0x0000FF00) >>  8
		let alpha = hex < 0xFFFFFF ? 0xFF                   : (hex & 0x000000FF)
		let max: CGFloat = 255
		self.init(red: CGFloat(red)/max, green: CGFloat(green)/max, blue: CGFloat(blue)/max, alpha: CGFloat(alpha)/max)
	}

	public func dilute(intensity: CGFloat = 0.5) -> UIColor {
		return blend(color: .white, intensity: intensity)
	}

	public func blend(color: UIColor, intensity: CGFloat = 0.5) -> UIColor {
		let l1 = 1.0 - intensity
		let l2 = intensity
		guard l1 > 0 else { return color }
		guard l2 > 0 else { return self }
		var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
		var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)

		self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
		color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

		return UIColor(red: l1*r1 + l2*r2, green: l1*g1 + l2*g2, blue: l1*b1 + l2*b2, alpha: l1*a1 + l2*a2)
	}
}
