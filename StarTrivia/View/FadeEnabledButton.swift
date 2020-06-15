//
//  FadeEnabledButton.swift
//  StarTrivia
//
//  Created by Arun Kumar Mora on 3/27/20.
//  Copyright © 2020 Arun Kumar Mora. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {          //Property Observer
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            }else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
