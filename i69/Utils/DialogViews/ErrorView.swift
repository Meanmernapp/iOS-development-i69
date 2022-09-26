//
//  ErrorView.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import UIKit

class ErrorView: UIView {
    @IBOutlet weak var conCentreView: NSLayoutConstraint!
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBAction func btnOKAction(_ sender: Any) {
        hideView()
    }
    class func instanceFromNib() ->ErrorView {
        
        let view = UINib(nibName: "ErrorView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ErrorView
        
        return view
    
    }
    func showView()
    {
        alpha = 0.4
        conCentreView.constant = UIScreen.main.bounds.height/2
        self.layoutIfNeeded()
        
        isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            
            self.alpha = 1
            self.conCentreView.constant = 1
            self.layoutIfNeeded()
        }, completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                self.hideView()
            })
        })
    }
    func hideView()
    {
        if isHidden
        {
            return
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            self.alpha = 0.4
            self.conCentreView.constant = UIScreen.main.bounds.height/2 + 100
            self.layoutIfNeeded()
            
        }, completion: {_ in
            self.isHidden = true
        })
    }

}
