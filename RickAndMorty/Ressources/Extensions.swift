//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Thais Souza on 17/03/25.
//

import Foundation
import UIKit

extension UIView{
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
