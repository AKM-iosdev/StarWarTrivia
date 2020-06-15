//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 3/20/20.
//  Copyright © 2020 Arun Kumar Mora. All rights reserved.
//

import Foundation
import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
