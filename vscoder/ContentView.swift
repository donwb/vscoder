//
//  ContentView.swift
//  vscoder
//
//  Created by Don Browning on 4/26/20.
//  Copyright © 2020 Don Browning. All rights reserved.
//

import SwiftUI
import WebKit

var pageUrl = "https://www.esri.com/en-us/home"

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    
    @State private var showModal = false
    
    var pageUrl = "https://www.esri.com/en-us/home"
    
    var body: some View {
            
        
            VStack{
                Button("Show URL View"){
                    self.showModal.toggle()
                }.sheet(isPresented: $showModal){
                    URLView(showModal: self.$showModal).environmentObject(self.settings)
                }
                
                
                
                WebView().edgesIgnoringSafeArea(.all)
            }
        
    }
}

struct WebView: UIViewRepresentable {
    @EnvironmentObject var settings: UserSettings
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.scrollView.isScrollEnabled = false
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {
    print(pageUrl)
    print("settings: " + self.settings.url)
    let newUrl = self.settings.url
    
    //let liveView = "https://www.google.com"
    let liveView = newUrl
    if let url = URL(string: liveView) {
       let request = URLRequest(url: url)
       webView.load(request)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
