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
    var webViewRect: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewRect = WKWebView()
        //container = UIView() !!!! IMPORTANT if you create an IB Outlet and do an explicit inizialization like here, you are overriding the reference and the original Outlet can't be accessed. View become lost.
        container.addSubview(webViewRect)
        print("view did load")
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webViewRect.frame = frame
        print("view did appear")

        prepareLoadRequest(IMDBURL!)
    }

    @IBAction func cancelWebView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveWebPage(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("URL saved", object: nil, userInfo: ["adress":(webViewRect.URL?.absoluteString)!])
        //(NSNotification(name: "URL saved", object: webViewRect.URL))
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func prepareLoadRequest(url: String) {
        let request: NSURLRequest!
        
        if let requestURL = IMDBURL where IMDBURL != "" {
            request = NSURLRequest(URL: NSURL(string: requestURL)!)
            print("if request")
        } else {
            request = NSURLRequest(URL: NSURL(string: "http://www.imdb.com")!)
            print("else request")
        }
        print("nsurl should be initialized with \(IMDBURL!)")
        webViewRect.loadRequest(request)
        
        /*while(webView.loading) {
            print(NSDate(timeIntervalSince1970: NSTimeInterval.init()))
        }*/
    }
    deinit {
        
        print("webView closed")
    }
    
}
