//
//  UIColor+InstrumentsUI.swift
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

extension UIColor {
   public convenience init(red: UInt8, green: UInt8, blue: UInt8, alpha: CGFloat = 1.0) {
      self.init(
         red: CGFloat(red) / 255.0,
         green: CGFloat(green) / 255.0,
         blue: CGFloat(blue) / 255.0,
         alpha: alpha
      )
   }

   public convenience init(rgb: Int, alpha: CGFloat = 1.0) {
      let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
      let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
      let blue = CGFloat(rgb & 0x0000FF) / 255.0

      self.init(red: red, green: green, blue: blue, alpha: alpha)
   }

   public convenience init(rgba: Int64) {
      let red = CGFloat((rgba & 0xFF000000) >> 32) / 255.0
      let green = CGFloat((rgba & 0x00FF0000) >> 16) / 255.0
      let blue = CGFloat((rgba & 0x0000FF00) >> 8) / 255.0
      let alpha = CGFloat(rgba & 0x000000FF) / 255.0

      self.init(red: red, green: green, blue: blue, alpha: alpha)
   }

   public convenience init(rgb: String, alpha: CGFloat = 1.0) {
      let hashCharSet = CharacterSet(charactersIn: "#")
      guard let rgb = Int(rgb.trimmingCharacters(in: hashCharSet)) else {
         self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: alpha)
         return
      }

      self.init(rgb: rgb, alpha: alpha)
   }

   public convenience init(rgba: String) {
      let hashCharSet = CharacterSet(charactersIn: "#")
      guard let rgba = Int64(rgba.trimmingCharacters(in: hashCharSet)) else {
         self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
         return
      }

      self.init(rgba: rgba)
   }

   public convenience init(h: Int, s: Int, b: Int, alpha: CGFloat = 1.0) {
      let h = min(360, max(0, h))
      let s = min(100, max(0, s))
      let b = min(100, max(0, b))

      self.init(
         hue: CGFloat(h) / 360.0,
         saturation: CGFloat(s) / 100.0,
         brightness: CGFloat(b) / 100.0,
         alpha: alpha
      )
   }

   public func withBrightnessFactor(_ factor: CGFloat) -> UIColor {
      var h: CGFloat = 0.0
      var s: CGFloat = 0.0
      var b: CGFloat = 0.0
      var a: CGFloat = 0.0

      guard self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) else {
         return self
      }

      return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
   }
}
