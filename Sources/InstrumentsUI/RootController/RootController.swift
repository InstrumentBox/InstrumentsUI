//
//  RootController.swift
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

open class RootController: UIViewController {
   @IBOutlet
   open weak var delegate: RootControllerDelegate?

   open var contentViewController: UIViewController? {
      get {
         _contentViewController
      }
      set {
         setContentViewController(newValue, animated: false)
      }
   }

   private var _contentViewController: UIViewController?

   // MARK: - Init

   public init(contentViewController: UIViewController) {
      super.init(nibName: nil, bundle: nil)

      _contentViewController = contentViewController
   }

   public required init?(coder: NSCoder) {
      super.init(coder: coder)
   }

   // MARK: - View Lifecycle

   open override func viewDidLoad() {
      super.viewDidLoad()

      if let _contentViewController = _contentViewController, _contentViewController.parent == nil {
         addChild(_contentViewController)
         view.addSubview(_contentViewController.view)
         _contentViewController.view.frame = view.bounds
         _contentViewController.didMove(toParent: self)
      }
   }

   // MARK: - Content Controller Managing

   open func setContentViewController(_ contentViewController: UIViewController?, animated: Bool) {
      delegate?.rootController?(self, willShow: contentViewController)

      let previousContentViewController = _contentViewController
      _contentViewController = contentViewController

      guard isViewLoaded else {
         return
      }

      performTransition(
         from: previousContentViewController,
         to: _contentViewController,
         animated: animated
      ) { [self] in
         delegate?.rootController?(self, didShow: contentViewController)
      }
   }

   private func performTransition(
      from previous: UIViewController?,
      to current: UIViewController?,
      animated: Bool,
      completion: @escaping () -> Void
   ) {
      previous?.willMove(toParent: nil)
      if let current = current {
         addChild(current)
         view.addSubview(current.view)
         current.view.frame = view.bounds
      }

      let properties = delegate?.rootController?(
         self,
         propertiesForTransitionFrom: previous,
         to: current
      ) ?? .default

      UIView.transition(
         with: view,
         duration: animated ? properties.duration : 0.0,
         options: properties.options,
         animations: {
            previous?.view.removeFromSuperview()
         },
         completion: { [self] _ in
            previous?.removeFromParent()
            current?.didMove(toParent: self)
            completion()
         }
      )
   }
}
