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
    
    convenience init(url: String) {
       self.init()
        IMDBURL = url
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    /*init(url: String, nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }*/
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 

    
    var IMDBURL: String? = ""

    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet var container: UIView!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container = UIView()
        container.addSubview(webView)
        print("view did load")
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        loadRequest(IMDBURL!)
    }

    @IBAction func cancelWebView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveWebPage(sender: AnyObject) {
        loadRequest(IMDBURL!)
    }
    
    func loadRequest(url: String) {
        let request: NSURLRequest?
        
        if let requestURL = IMDBURL {
            request = NSURLRequest(URL: NSURL(string: requestURL)!)
            print("if request")
        } else {
            request = NSURLRequest(URL: NSURL(string: "http://www.imdb.com")!)
            print("else request")
        }
        print("nsurl should be initialized with \(IMDBURL)")
        webView.loadRequest(request!)

        /*while(webView.loading) {
            progress.progress += 0.5
        }*/
    }
    
}
