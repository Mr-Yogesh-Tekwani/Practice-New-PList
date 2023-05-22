//
//  SecViewController.swift
//  Practice New PList
//
//  Created by Yogesh Tekwani on 5/19/23.
//

import UIKit
import WebKit

class SecViewController: UIViewController, WKNavigationDelegate {

    var link : String = "google.com"
    var webview : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview = WKWebView(frame: view.bounds)
        webview.navigationDelegate = self
        webview.contentMode = .scaleToFill
        
        self.view.addSubview(webview)
        
        webview.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            webview.topAnchor.constraint(equalTo: safeArea.topAnchor),
            webview.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            webview.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        
        let url = URL(string: link)
        let req = URLRequest(url: url!)
        webview.load(req)
        
    }

}
