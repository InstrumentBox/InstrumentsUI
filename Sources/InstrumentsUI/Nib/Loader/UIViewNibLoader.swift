//
//  UIViewNibLoader.swift
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

@MainActor
open class UIViewNibLoader<View: NibLoadableView> {
   public let ibView: View

   // MARK: - Init

   public init(ibView: View) {
      self.ibView = ibView
   }

   // MARK: - Loading

   open func awakeAfter(using coder: NSCoder) -> Any? {
      let view: View = .loadFromNib()
      copyConstraints(to: view)
      copyProperties(to: view)
      return view
   }

   open func copyProperties(to view: View) {
      view.autoresizingMask = ibView.autoresizingMask
      view.frame = ibView.frame
      view.isHidden = ibView.isHidden
      view.isUserInteractionEnabled = ibView.isUserInteractionEnabled
      view.translatesAutoresizingMaskIntoConstraints = ibView.translatesAutoresizingMaskIntoConstraints
   }

   open func copyConstraints(to view: View) {
      view.addConstraints(ibView.constraints.map { ibViewConstraint in
         NSLayoutConstraint(
            item: ibViewConstraint.firstItem === ibView ? view : ibViewConstraint.firstItem as Any,
            attribute: ibViewConstraint.firstAttribute,
            relatedBy: ibViewConstraint.relation,
            toItem: ibViewConstraint.secondItem === ibView ? view : ibViewConstraint.secondItem,
            attribute: ibViewConstraint.secondAttribute,
            multiplier: ibViewConstraint.multiplier,
            constant: ibViewConstraint.constant
         )
      })
   }

   open func prepareForInterfaceBuilder() {
      let subviews = ibView.subviews
      for subview in subviews {
         subview.alpha = 0.0
      }

      ibView.backgroundColor = .clear

      let view: View = .loadFromNib()
      copyProperties(to: view)
      ibView.addSubview(view)
      view.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate(view.edgesAnchor.constraints(equalTo: ibView.edgesAnchor))
   }
}
