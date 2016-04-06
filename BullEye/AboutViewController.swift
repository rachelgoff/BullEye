//
//  AboutViewController.swift
//  BullEye
//
//  Created by Rachel Goff on 3/20/16.
//  Copyright © 2016 Rachel Goff. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // if let htmlFile = NSBundle.mainBundle().pathsForResource("BullsEye", ofType: "html"){
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html"){
            if let htmlData = NSData(contentsOfFile: htmlFile){
                let baseURL = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                    //webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
                    webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
