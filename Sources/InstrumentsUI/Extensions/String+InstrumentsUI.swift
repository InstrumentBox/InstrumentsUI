//
//  String+InstrumentsUI.swift
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

extension String {
   public func size(with attributes: [NSAttributedString.Key: Any]) -> CGSize {
      (self as NSString).size(withAttributes: attributes)
   }

   public func draw(at point: CGPoint, with attributes: [NSAttributedString.Key: Any]) {
      (self as NSString).draw(at: point, withAttributes: attributes)
   }

   public func draw(in rect: CGRect, with attributes: [NSAttributedString.Key: Any]) {
      (self as NSString).draw(in: rect, withAttributes: attributes)
   }

   public func size(
      with attributes: [NSAttributedString.Key: Any],
      boundedBy size: CGSize = CGSize(
         width: CGFloat.greatestFiniteMagnitude,
         height: CGFloat.greatestFiniteMagnitude
      )
   ) -> CGSize {
      (self as NSString).boundingRect(
         with: size,
         options: [.usesFontLeading, .truncatesLastVisibleLine],
         attributes: attributes,
         context: nil
      ).size
   }

   public func variantFittingPresentationWidth(_ width: Int) -> String {
      (self as NSString).variantFittingPresentationWidth(width)
   }
}
