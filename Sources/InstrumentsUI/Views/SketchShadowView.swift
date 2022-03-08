//
//  SketchShadowView.swift
//
//  Copyright © 2022 Aleksei Zaikin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

@IBDesignable
open class SketchShadowView: UIView {
   @IBInspectable
   open var shadowColor: UIColor? {
      didSet {
         layer.shadowColor = shadowColor?.cgColor
      }
   }

   @IBInspectable
   open var shadowOpacity: Float = 0.0 {
      didSet {
         layer.shadowOpacity = shadowOpacity
      }
   }

   @IBInspectable
   open var shadowOffset: CGSize = .zero {
      didSet {
         layer.shadowOffset = shadowOffset
      }
   }

   @IBInspectable
   open var shadowBlur: CGFloat = 0.0 {
      didSet {
         layer.shadowRadius = shadowBlur / 2.0
      }
   }

   @IBInspectable
   open var shadowSpread: CGFloat = 0.0 {
      didSet {
         updateShadowPath()
      }
   }

   // MARK: - Layout

   open override func layoutSubviews() {
      super.layoutSubviews()

      updateShadowPath()
   }

   private func updateShadowPath() {
      let delta = -shadowSpread
      layer.shadowPath = UIBezierPath(rect: bounds.insetBy(dx: delta, dy: delta)).cgPath
   }
}
