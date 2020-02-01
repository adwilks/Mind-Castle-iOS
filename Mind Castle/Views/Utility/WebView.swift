//
//  WebView.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2020/01/30.
//  Copyright © 2020 Adrien Wilkins. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    /*
    Function: makeUIView
    *UIViewRepresentable requirement*
    Parameters:
    context: UIViewRepresentableContext<WebView> - ?
    
    Dependencies: None
    makeUIView takes the context and returns a webview viewtype that can be used in a Switft UIView.
    */
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
    }
    
    /*
     Function: updateUIView
     *UIViewRepresentable requirement*
     Parameters:
     uiView: WKWebView - The view which we are going to update
     context: UIViewRepresentableContext<WebView> - ?
     
     Dependencies: <local> urlString
     
     updateUIView takes the uiView and context passed in and updates the uiView with a URL defined elsewhere in WebView.
     */
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString {
            if let url = URL(string: safeURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

