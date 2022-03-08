//
//  GradientView.swift
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
open class GradientView: UIView {
   @IBInspectable
   open var fromColor: UIColor? {
      didSet {
         updateGradient()
      }
   }

   @IBInspectable
   open var toColor: UIColor? {
      didSet {
         updateGradient()
      }
   }

   @IBInspectable
   open var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
      didSet {
         updateGradient()
      }
   }

   @IBInspectable
   open var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
      didSet {
         updateGradient()
      }
   }

   // MARK: - Inits

   public override init(frame: CGRect) {
      super.init(frame: frame)

      updateGradient()
   }

   public required init?(coder: NSCoder) {
      super.init(coder: coder)

      updateGradient()
   }

   // MARK: - Gradient

   open override class var layerClass: AnyClass {
      CAGradientLayer.self
   }

   private func updateGradient() {
      guard
         let layer = layer as? CAGradientLayer,
         let fromColor = fromColor,
         let toColor = toColor
      else {
         return
      }

      layer.colors = [fromColor, toColor]
      layer.startPoint = startPoint
      layer.endPoint = endPoint
   }
}
