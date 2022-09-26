//
//  GradientButton.swift
//  i69
//
//  Created by The Mac Store on 13/04/2022.
//

import Foundation
import UIKit

class GradientButton : UIButton
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applySocialGradient()
        self.clipsToBounds = true
        
    }
}

class GradientGoldenButton : UIButton
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyGradient(colours: [UIColor(named: "golden_grad_start") ?? UIColor.black,
                                          UIColor(named: "golden_grad_end") ?? UIColor.black])
        
        self.clipsToBounds = true
        
    }
}
