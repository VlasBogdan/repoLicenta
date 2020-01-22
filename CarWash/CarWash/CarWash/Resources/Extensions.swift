//
//  Extensions.swift
//  CarWash
//
//  Created by Bogdan Vlas on 1/21/20.
//  Copyright © 2020 Bogdan Vlas. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
   
  class var storyboardId: String {
    return "\(self)"
  }
   
  static func instantiate() -> Self {
    return viewController(viewControllerClass: self)
  }
   
  private static func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let scene = storyboard.instantiateViewController(withIdentifier: storyboardId) as? T else { fatalError() }
     
    return scene
  }
}
