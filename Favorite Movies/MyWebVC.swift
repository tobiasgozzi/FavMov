//
//  MyWebVC.swift
//  Favorite Movies
//
//  Created by Tobias Gozzi on 31.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit
import WebKit

class MyWebVC: UIViewController {
    
    /*convenience init(url: String) {
        self.init()
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("coder initialized")
    }
     */

    
    var IMDBURL: String!

    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet var container: UIView!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
    }

    @IBAction func cancelWebView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveWebPage(sender: AnyObject) {
        loadRequest(IMDBURL)
        print(self.nibName)
        print(self.nibBundle)
    }
    
    func loadRequest(url: String) {
        let request = NSURLRequest(URL: NSURL(string: IMDBURL)!)
        webView.loadRequest(request)

        /*while(webView.loading) {
            progress.progress += 0.5
        }*/
    }
}
