//
//  EdgesAnchor.Edges.swift
//
//  Copyright © 2024 Aleksei Zaikin.
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

extension EdgesAnchor {
   public struct Edges: OptionSet {
      public var rawValue: Int

      // MARK: - Init

      public init(rawValue: Int) {
         self.rawValue = rawValue
      }

      // MARK: - Predefined

      public static let top = Edges(rawValue: 1 << 0)
      public static let leading = Edges(rawValue: 1 << 1)
      public static let bottom = Edges(rawValue: 1 << 2)
      public static let trailing = Edges(rawValue: 1 << 3)

      public static let all: Edges = [.top, .leading, .bottom, .trailing]
   }
}
