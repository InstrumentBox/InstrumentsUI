//
//  EdgeInsets+InstrumentsUI.swift
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

extension UIEdgeInsets {
   /// Creates and returns a new `UIEdgeInsets` object with the same value for each side.
   ///
   /// - Parameters:
   ///   - value: Inset value.
   /// - Returns: Newly created `UIEdgeInsets` object.
   public static func all(_ value: CGFloat) -> UIEdgeInsets {
      UIEdgeInsets(top: value, left: value, bottom: value, right: value)
   }

   /// Creates and returns a new `UIEdgeInsets` object with equal top/bottom and left/right values.
   ///
   /// - Parameters:
   ///   - v: Top and bottom inset. Defaults to 0.
   ///   - h: Left and right inset. Defaults to 0.
   /// - Returns: Newly created `UIEdgeInsets` object.
   public static func symmetric(v: CGFloat = 0.0, h: CGFloat = 0.0) -> UIEdgeInsets {
      UIEdgeInsets(top: v, left: h, bottom: v, right: h)
   }
   
   /// Creates and returns a new `UIEdgeInsets` object with given values.
   ///
   /// - Parameters:
   ///   - top: Top inset. Defaults to 0.
   ///   - left: Left inset. Defaults to 0.
   ///   - bottom: Bottom inset. Defaults to 0.
   ///   - right: Right inset. Defaults to 0.
   /// - Returns: New create `UIEdgeInsets` object.
   public static func insets(
      top: CGFloat = 0.0,
      left: CGFloat = 0.0,
      bottom: CGFloat = 0.0,
      right: CGFloat = 0.0
   ) -> UIEdgeInsets {
      UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
   }
}

extension NSDirectionalEdgeInsets {
   /// Creates and returns a new `NSDirectionalEdgeInsets` object with the same value for each side.
   ///
   /// - Parameters:
   ///   - value: Inset value.
   /// - Returns: Newly created `NSDirectionalEdgeInsets` object.
   public static func all(_ value: CGFloat) -> NSDirectionalEdgeInsets {
      NSDirectionalEdgeInsets(top: value, leading: value, bottom: value, trailing: value)
   }

   /// Creates and returns a new `NSDirectionalEdgeInsets` object with
   /// equal top/bottom and left/right values.
   ///
   /// - Parameters:
   ///   - v: Top and bottom inset. Defaults to 0.
   ///   - h: Leading and trailing inset. Defaults to 0.
   /// - Returns: Newly created `NSDirectionalEdgeInsets` object.
   public static func symmetric(v: CGFloat = 0.0, h: CGFloat = 0.0) -> NSDirectionalEdgeInsets {
      NSDirectionalEdgeInsets(top: v, leading: h, bottom: v, trailing: h)
   }

   /// Creates and returns a new `NSDirectionalEdgeInsets` object with given values.
   ///
   /// - Parameters:
   ///   - top: Top inset. Defaults to 0.
   ///   - leading: Leading inset. Defaults to 0.
   ///   - bottom: Bottom inset. Defaults to 0.
   ///   - trailing: Trailing inset. Defaults to 0.
   /// - Returns: New create `NSDirectionalEdgeInsets` object.
   public static func insets(
      top: CGFloat = 0.0,
      leading: CGFloat = 0.0,
      bottom: CGFloat = 0.0,
      trailing: CGFloat = 0.0
   ) -> NSDirectionalEdgeInsets {
      NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
   }
}
