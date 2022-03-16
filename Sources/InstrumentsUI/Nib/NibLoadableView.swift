//
//  NibLoadableView.swift
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

public protocol NibLoadableView where Self: UIView {
   static var nibName: String { get }

   static var nibBundle: Bundle { get }

   static func loadFromNib() -> Self
}

extension NibLoadableView {
   public static var nibName: String {
      "\(Self.self)"
   }

   public static var nibBundle: Bundle {
      Bundle(for: Self.self)
   }

   public static func loadFromNib() -> Self {
      let nib = UINib(nibName: nibName, bundle: nibBundle)
      let nibContent = nib.instantiate(withOwner: nib, options: nil)
      guard let view = nibContent.first(where: { $0 is Self }) as? Self else {
         fatalError("Can't find view of \(Self.self) in \(nib)")
      }

      return view
   }
}
