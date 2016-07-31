//
//  MyWebVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 31.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import WebKit

class MyWebVC: UIViewController, UIWebViewDelegate {
    
    final let IMDBURL = "http://www.imdb.com"

    @IBOutlet var container: UIView!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)
        let request = NSURLRequest(URL: NSURL(fileURLWithPath: IMDBURL))
        webView.loadRequest(request)

    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame

    }

    @IBAction func cancelWebView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
