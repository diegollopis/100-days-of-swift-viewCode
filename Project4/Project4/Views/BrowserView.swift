//
//  BrowserView.swift
//  Project4
//
//  Created by Mobile2you on 02/01/22.
//

import UIKit
import WebKit

class BrowserView: UIView {
    
    lazy var browser: WKWebView = {
        let browser = WKWebView()
        return browser
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
        configBrowser()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBrowser() {
        let url = URL(string: "https://www.hackingwithswift.com")!
        let request = URLRequest(url: url)
        browser.load(request)
        browser.allowsBackForwardNavigationGestures = true
    }
    
    func configNavigationDelegate(delegate: WKNavigationDelegate) {
        browser.navigationDelegate = delegate
    }
}

extension BrowserView: ViewCode {
    
    func configView() {
        addSubview(browser)
    }
    
    func configConstraints() {
        browser.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide.snp.edges)
        }
    }
}
