//
//  UITableView+Dequeuing.swift
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

extension UITableView {
   public func dequeueReusableCell<Cell: UITableViewCell>(
      _ reusableCell: Reusable<Cell>,
      for indexPath: IndexPath
   ) -> Cell {
      let anyCell = dequeueReusableCell(withIdentifier: reusableCell.reuseID, for: indexPath)
      guard let cell = anyCell as? Cell else {
         let expected = "expected \(Cell.self)"
         let received = "received \(type(of: anyCell))"
         assert(false, "Couldn't dequeue cell: \(expected) but \(received)")
         return Cell(style: .default, reuseIdentifier: reusableCell.reuseID)
      }

      return cell
   }

   public func dequeueReusableHeaderFooter<HeaderFooter: UITableViewHeaderFooterView>(
      _ reusableHeaderFooter: Reusable<HeaderFooter>
   ) -> HeaderFooter {
      let anyHeaderFooter = dequeueReusableHeaderFooterView(
         withIdentifier: reusableHeaderFooter.reuseID
      )
      guard let headerFooter = anyHeaderFooter as? HeaderFooter else {
         let expected = "expected \(HeaderFooter.self)"
         let received = "received \(type(of: anyHeaderFooter))"
         assert(false, "Couldn't dequeue header footer: \(expected) but \(received)")
         return HeaderFooter(reuseIdentifier: reusableHeaderFooter.reuseID)
      }

      return headerFooter
   }
}
