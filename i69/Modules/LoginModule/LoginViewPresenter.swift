//
//  LoginPresenter.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation
//import FacebookLogin
import GoogleSignIn
import Apollo

protocol LoginViewPresenterProtocol: AnyObject {
    func navigateToIntrestedSignUpModule()
    func callForGoogleSDK()
    func callFacebookSDK()
    func socialLoginQL(authToken : String,accessVerifier : String,provider : String)
    func socialLoginResponse(data : LoginUserMutation.Data?, error : Error?)
    func navigateToTabbarModule()
}

class LoginViewPresenter {

    unowned var view: LoginViewControllerProtocol
    let router: LoginViewRouterProtocol?
    let interactor: LoginViewInteractorProtocol?

    init(interactor: LoginViewInteractorProtocol, router: LoginViewRouterProtocol, view: LoginViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginViewPresenter: LoginViewPresenterProtocol {
    func navigateToTabbarModule()
    {
        self.router?.navigateToTabbarModule(view: self.view)
    }
    func socialLoginResponse(data : LoginUserMutation.Data?, error : Error?)
    {
        self.view.socialLoginResponse(data: data, error: error)
    }
    func socialLoginQL(authToken : String,accessVerifier : String,provider : String)
    {
        self.view.showLoadingSign()
        self.interactor?.socialLoginQL(authToken: authToken, accessVerifier: accessVerifier, provider: provider)
    }
    func navigateToIntrestedSignUpModule()
    {
        self.router?.navigateToIntrestedSignUpModule(view: self.view)
    }
    func callForGoogleSDK()
    {
        
        let signInConfig = GIDConfiguration.init(clientID: ApiKeys.googleSignInApiKey)
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self.view as! LoginViewController) { user, error in
            guard error == nil else {
                return
                
            }
            self.socialLoginQL(authToken: user?.authentication.idToken ?? "", accessVerifier: "", provider: LoginProvide.googleProvider.rawValue)
            
        }
    }
    func callFacebookSDK()
    {
        //        self.presenter?.navigateToIntrestedSignUpModule()
//        let loginManager = LoginManager()
        
//        if let _ = AccessToken.current {
//            // Access token available -- user already logged in
//            // Perform log out
//
//            // 2
//            loginManager.logOut()
//
//
//        } else {
            // Access token not available -- user already logged out
            // Perform log in
            
            // 3
//            loginManager.logIn(permissions: ["public_profile", "email"], from: self.view as! LoginViewController) { [weak self] (result, error) in
//                
//                // 4
//                // Check for error
//                guard error == nil else {
//                    // Error occurred
//                    print(error!.localizedDescription)
//                    return
//                }
//                
//                // 5
//                // Check for cancel
//                guard let result = result, !result.isCancelled else {
//                    print("User cancelled login")
//                    return
//                }
//                self?.view.showLoadingSign()
//                self?.socialLoginQL(authToken: result.token?.tokenString ?? "", accessVerifier: "", provider: LoginProvide.fbProvide.rawValue)
//                Profile.loadCurrentProfile { profile, error in
//                    SignUpHelper.shared.user.email = profile?.email ?? ""
//                    SignUpHelper.shared.user.fullName = profile?.name ?? ""
////
//                }
                
                // Successfully logged in
                
//            }
//        }
    }
}
