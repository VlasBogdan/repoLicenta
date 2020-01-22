//
//  BorderButton.swift
//  CarWash
//
//  Created by Bogdan Vlas on 12/1/19.
//  Copyright © 2019 Bogdan Vlas. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
        setGradientBackground(colorOne: Colors.darkBlue, colorTwo: Colors.brightBlue)
    
    }
    
    
}

class BorderButtonone: UIButton{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
        setGradientBackground(colorOne: Colors.blueDark, colorTwo: Colors.darkBlue)
    }
    
}

class createButton: UIButton{
override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = frame.size.height/2
    layer.masksToBounds = true
    setGradientBackground(colorOne: Colors.grey, colorTwo: Colors.grey)
    }
}
