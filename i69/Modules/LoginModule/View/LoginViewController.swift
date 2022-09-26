//
//  LoginViewController.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import UIKit
import GoogleSignIn
import SafariServices
import Apollo

protocol LoginViewControllerProtocol: AnyObject {
    func showLoadingSign()
    func socialLoginResponse(data : LoginUserMutation.Data?, error : Error?)
}
class LoginViewController: BaseViewController {
    
    var presenter: LoginViewPresenterProtocol?
    
    
    @IBOutlet var btnFacebook: UIButton!
    @IBOutlet var btnTwitter: UIButton!
    @IBOutlet var btnGoogle: UIButton!
    
    @IBOutlet weak var lbTermsAndCondition: UILabel!
    
    @IBAction func btnFBAction(_ sender: Any) {
        self.presenter?.callFacebookSDK()
        
    }
    
    @IBAction func btnGoogleAction(sender: Any) {
        
        self.presenter?.callForGoogleSDK()
    }
    var web : SocialAuthViewController?
//    var safariVC : SFSafariViewController?
    @IBAction func btnTwitterAction(sender: Any) {
        
        if web == nil
        {
            web = SocialAuthViewController()
            
            web?.callback = { (authToken, accessVerifier) in
                self.presenter?.socialLoginQL(authToken: authToken, accessVerifier: accessVerifier, provider: LoginProvide.twitterProvide.rawValue)
            }
            
        }
        
        web?.url = ApiKeys.twitterAuthUrl
                
        present(web!, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDesign()
        if let text = lbTermsAndCondition.text
        {
            setAttributeString(text: text, underlinePosition: [[83,21],[108,14]])
            
        }
        GIDSignIn.sharedInstance.signOut()
        setUpGasture()
        
    }
    
    func setUpDesign()
    {
        
        self.btnFacebook.applySocialGradient()
        self.btnTwitter.applySocialGradient()
        self.btnGoogle.applySocialGradient()
        
        
        
        
        
        
    }
    func setUpGasture()
    {
        lbTermsAndCondition.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        lbTermsAndCondition.isUserInteractionEnabled = true
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        
        if gesture.didTapAttributedTextInLabel(label: lbTermsAndCondition, inRange: NSRange(location:90,length:21)) {
            print("Tapped terms")
        } else if gesture.didTapAttributedTextInLabel(label: lbTermsAndCondition, inRange: NSRange(location:116,length:14)) {
            print("Tapped privacy")
        } else {
            print("Tapped none")
        }
    }
    
    func setAttributeString(text : String,underlinePosition: [[Int]])
    {
        
        let myMutableString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font :lbTermsAndCondition.font!])
        for position in underlinePosition
        {
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "golden")!, range: NSRange(location:position[0],length:position[1]))
            
            myMutableString.addAttributes([.underlineStyle : NSUnderlineStyle.single.rawValue],
                                          range: NSRange(location: position[0], length: position[1]))
            
            myMutableString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor(named: "golden")!, range: NSRange(location:position[0],length:position[1]))
        }
        lbTermsAndCondition.attributedText = myMutableString
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    func showLoadingSign() {
        showLoadingIndicator()
    }
    func socialLoginResponse(data : LoginUserMutation.Data?, error : Error?)
    {
        SignUpHelper.shared.user.id = data?.socialAuth?.id ?? ""
        SignUpHelper.shared.user.fullName = data?.socialAuth?.username ?? ""
        SignUpHelper.shared.token = data?.socialAuth?.token ?? ""
        hideLoadingIndicator()
        if error != nil {
            return
        }
        if let user = data
        {
            if user.socialAuth?.isNew ?? true
            {
                self.presenter?.navigateToIntrestedSignUpModule()
            }
            else{
                SharedPreference.setLoggedInUserId(SignUpHelper.shared.user.id)
                SharedPreference.setLoggedInUserToken(SignUpHelper.shared.token)
                self.presenter?.navigateToTabbarModule()
            }
        }
        
    }
    
}

