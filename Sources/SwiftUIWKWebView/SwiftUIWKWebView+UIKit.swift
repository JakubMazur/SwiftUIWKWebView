//
//  WKWebView_UIKit.swift
//  SwiftUIWKWebView
//
//  Created by Jakub Mazur on 27/06/2021.
//

import SwiftUI
import WebKit

#if canImport(UIKit)

import UIKit

public struct SwiftUIWKWebView: UIViewRepresentable {
	public typealias NSViewType = WKWebView
	
	@ObservedObject var viewModel: WebViewModel
	
	let webView: WKWebView = WKWebView()

	public func makeUIView(context: UIViewRepresentableContext<SwiftUIWKWebView>) -> WKWebView {
		self.webView.navigationDelegate = context.coordinator
		self.webView.load(viewModel.request)
		return self.webView
	}

	public func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<SwiftUIWKWebView>) { }
}


#if DEBUG
struct SwiftUIWKWebView_Previews: PreviewProvider {
	static var previews: some View {
		SwiftUIWKWebView(viewModel: WebViewModel(urlString: "https://twitter.com/jkmazur")!)
	}
}
#endif

#endif
