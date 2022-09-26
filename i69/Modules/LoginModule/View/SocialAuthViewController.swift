//
//  SocialAuthViewController.swift
//  i69
//
//  Created by The Mac Store on 13/04/2022.
//

import UIKit
import WebKit

class SocialAuthViewController: UIViewController {

    @IBOutlet weak var wWebView: WKWebView!
    
    var url = ""
    var callback : ((String,String)->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: url)!)
                
        self.wWebView.load(request)
        if #available(iOS 14.0, *) {
            self.wWebView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        } else {
            // Fallback on earlier versions
        }
        wWebView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }



}
extension SocialAuthViewController :WKNavigationDelegate
{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        
        if let path = webView.url?.path
        {
            if (path == ApiKeys.twitterCallBackUrl) {
                
                
                if let URL = webView.url
                {
                    let param = URL.params()
                    if let oauth_token = param["oauth_token"] as? String
                    {
                        self.callback?(oauth_token, (param["oauth_verifier"] as? String) ?? "")
                    }
                }
                decisionHandler(.cancel)
                dismiss(animated: true)
                return
            }
        }
        decisionHandler(.allow)
    }
}
