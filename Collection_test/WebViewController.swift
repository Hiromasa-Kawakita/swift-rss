//
//  WebViewController.swift
//  Collection_test
//
//  Created by 川北 紘正 on 2019/06/27.
//  Copyright © 2019 川北 紘正. All rights reserved.
//

import UIKit
import WebKit
import Accounts

class WebViewController: UIViewController {
    
    let wkWebView = WKWebView()
    var station: Station!
    
    var backButton: UIButton!
    var forwadButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targetUrl = station.link!
        wkWebView.frame = view.frame
//        wkWebView.navigationDelegate = self
//        wkWebView.uiDelegate = self
        
        // スワイプでの「戻る・すすむ」を有効にする
//        wkWebView.allowsBackForwardNavigationGestures = true
        
        let urlRequest = URLRequest(url:URL(string: targetUrl)!)
        wkWebView.load(urlRequest)
        view.addSubview(wkWebView)
        
//        createWebControlParts()
    }
    
    @IBAction func activityButton(_ sender: UIBarButtonItem) {
        // 共有する項目
        let shareText = station.title ?? "タイトルが見つかりません"
        let shareWebsite = NSURL(string: station.link ?? "https://www.apple.com/")!
//        let shareImage = UIImage(named: "defaultImage")!
//        let shareImage = UIImage(url: station.image!)
//        let activityItems: [Any] = [shareText, shareWebsite, shareImage]
        let activityItems: [Any] = [shareText, shareWebsite]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
//        let excludedActivityTypes = [
//            UIActivity.ActivityType.postToFacebook,
//            UIActivity.ActivityType.postToTwitter,
//            UIActivity.ActivityType.message,
//            UIActivity.ActivityType.saveToCameraRoll,
//            UIActivity.ActivityType.print
//        ]
        
//        activityVC.excludedActivityTypes = excludedActivityTypesx
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 戻る・すすむボタン作成
//    private func createWebControlParts() {
//
//        let buttonSize = CGSize(width:40,height:40)
//        let offseetUnderBottom:CGFloat = 60
//        let yPos = (UIScreen.main.bounds.height - offseetUnderBottom)
//        let buttonPadding:CGFloat = 10
//
//        let backButtonPos = CGPoint(x:buttonPadding, y:yPos)
//        let forwardButtonPos = CGPoint(x:(buttonPadding + buttonSize.width + buttonPadding), y:yPos)
//
//        backButton = UIButton(frame: CGRect(origin: backButtonPos, size: buttonSize))
//        forwadButton = UIButton(frame: CGRect(origin:forwardButtonPos, size:buttonSize))
//
//        backButton.setTitle("<", for: .normal)
//        backButton.setTitle("< ", for: .highlighted)
//        backButton.setTitleColor(.white, for: .normal)
//        backButton.layer.backgroundColor = UIColor.black.cgColor
//        backButton.layer.opacity = 0.6
//        backButton.layer.cornerRadius = 5.0
//        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
//        backButton.isHidden = true
//        view.addSubview(backButton)
//
//        forwadButton.setTitle(">", for: .normal)
//        forwadButton.setTitle(" >", for: .highlighted)
//        forwadButton.setTitleColor(.white, for: .normal)
//        forwadButton.layer.backgroundColor = UIColor.black.cgColor
//        forwadButton.layer.opacity = 0.6
//        forwadButton.layer.cornerRadius = 5.0
//        forwadButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
//        forwadButton.isHidden = true
//        view.addSubview(forwadButton)
//
//    }
    
//    @objc private func goBack() {
//        wkWebView.goBack()
//    }
//
//    @objc private func goForward() {
//        wkWebView.goForward()
//    }
    
}

extension WebViewController: WKNavigationDelegate {
    
    // ウェブのロード完了時に呼び出される
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    
//        backButton.isHidden = (webView.canGoBack) ? false : true
//        forwadButton.isHidden = (webView.canGoForward) ? false : true
//    }
}

// target=_blank対策
extension WebViewController: WKUIDelegate {
    
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
//                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//
//        if navigationAction.targetFrame == nil {
//            webView.load(navigationAction.request)
//        }
//
//        return nil
//    }
    
}
