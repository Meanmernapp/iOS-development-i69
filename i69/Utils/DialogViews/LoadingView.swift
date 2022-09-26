//
//  LoadinView.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import UIKit

class LoadingView: UIView {

    class func instanceFromNib() -> LoadingView {
        
        let view = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! LoadingView
        
        return view
    
    }

}
