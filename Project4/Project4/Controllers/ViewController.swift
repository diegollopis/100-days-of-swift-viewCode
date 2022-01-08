//
//  ViewController.swift
//  Project4
//
//  Created by Mobile2you on 30/12/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var websites = ["apple.com", "hackingwithswift.com", "brazcubas.edu.br", "devpass.com.br"]
    
    lazy var browserView: BrowserView = {
        let browser = BrowserView()
        return browser
    }()
    
    lazy var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.sizeToFit()
        return progress
    }()
    
    override func loadView() {
        super.loadView()
        view = browserView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        browserView.configNavigationDelegate(delegate: self)
        configRightBarButtonItem()
        configToolBar()
        configProgressBarObserver()
    }
    
    func configRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openButtonTapped))
    }
    
    func configToolBar() {
        let progressBar = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshWebView))
        toolbarItems = [progressBar, spacer, refreshButton]
        navigationController?.isToolbarHidden = false
    }
    
    @objc func openButtonTapped() {
        let alert = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for site in websites {
            alert.addAction(UIAlertAction(title: site, style: .default, handler: openSelectedPage))
        }
        // Important for iPads
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
    
    func openSelectedPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        let request = URLRequest(url: url)
        browserView.browser.load(request)
    }
    
    @objc func refreshWebView() {
        browserView.browser.reload()
    }
    
    func configProgressBarObserver() {
        browserView.browser.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(browserView.browser.estimatedProgress)
        }
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
            if let host = url?.host {
                for website in websites {
                    if host.contains(website) {
                        decisionHandler(.allow)
                        return
                    }
                }
            }
            decisionHandler(.cancel)
    }
}

 
