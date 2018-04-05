//
//  WebViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 04/04/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var url: String!

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func runJS(_ sender: Any) {
        
        webView.stringByEvaluatingJavaScript(from: "alert('oi')")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webPageURL = URL(string: url)
        let request = URLRequest(url: webPageURL!)
        webView.loadRequest(request)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

extension WebViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        loading.stopAnimating()
        
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url!.absoluteString)
        if request.url!.absoluteString.range(of: "face") != nil {
            return false
            
        }
        return true
    }
}
