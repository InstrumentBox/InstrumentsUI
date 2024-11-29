//
//  EdgesAnchor.swift
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
public struct EdgesAnchor {
   private let anchorsTrait: AnchorsTrait

   // MARK: - Init

   init(anchorsTrait: AnchorsTrait) {
      self.anchorsTrait = anchorsTrait
   }

   // MARK: - Constraints

   public func constraints(
      equalTo anchor: EdgesAnchor,
      edges: Edges = .all,
      insets: NSDirectionalEdgeInsets = .zero
   ) -> [NSLayoutConstraint] {
      var constraints: [NSLayoutConstraint] = []
      if edges.contains(.top) {
         constraints.append(anchorsTrait.topAnchor.constraint(
            equalTo: anchor.anchorsTrait.topAnchor,
            constant: insets.top
         ))
      }
      if edges.contains(.leading) {
         constraints.append(anchorsTrait.leadingAnchor.constraint(
            equalTo: anchor.anchorsTrait.leadingAnchor,
            constant: insets.leading
         ))
      }
      if edges.contains(.bottom) {
         constraints.append(anchor.anchorsTrait.bottomAnchor.constraint(
            equalTo: anchorsTrait.bottomAnchor,
            constant: insets.bottom
         ))
      }
      if edges.contains(.trailing) {
         constraints.append(anchor.anchorsTrait.trailingAnchor.constraint(
            equalTo: anchorsTrait.trailingAnchor,
            constant: insets.trailing
         ))
      }
      return constraints
   }
}
