//
//  StoryboardInstantiatable.swift
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

public protocol StoryboardInstantiatable where Self: UIViewController {
   static var storyboardID: String { get }

   static func initial(from storyboardName: UIStoryboard.Name, in bundle: Bundle?) -> Self

   static func instantiate(from storyboardName: UIStoryboard.Name, in bundle: Bundle?) -> Self
}

extension StoryboardInstantiatable {
   public static var storyboardID: String {
      "\(Self.self)"
   }

   public static func initial(
      from storyboardName: UIStoryboard.Name,
      in bundle: Bundle? = nil
   ) -> Self {
      instantiate(storyboardName: storyboardName, bundle: bundle) { storyboard in
         storyboard.instantiateInitialViewController()
      }
   }

   public static func instantiate(
      from storyboardName: UIStoryboard.Name,
      in bundle: Bundle? = nil
   ) -> Self {
      instantiate(storyboardName: storyboardName, bundle: bundle) { storyboard in
         storyboard.instantiateViewController(withIdentifier: storyboardID)
      }
   }

   private static func instantiate(
      storyboardName: UIStoryboard.Name,
      bundle: Bundle?,
      instantiationBlock: @escaping (UIStoryboard) -> UIViewController?
   ) -> Self {
      let storyboard = UIStoryboard(name: storyboardName.raw, bundle: bundle)
      let anyViewController = instantiationBlock(storyboard)
      guard let viewController = anyViewController as? Self else {
         let expected = "expected \(Self.self)"
         let received = "received \(type(of: anyViewController)))"
         fatalError("Couldn't instantiate from \(storyboard): \(expected) but \(received)")
      }

      return viewController
   }
}
