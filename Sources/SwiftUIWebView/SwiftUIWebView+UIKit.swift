//
//  WKWebView_UIKit.swift
//  SwiftUIWebView
//
//  Created by Jakub Mazur on 27/06/2021.
//

import SwiftUI
import WebKit

#if canImport(UIKit)

import UIKit

public struct SwiftUIWebView: UIViewRepresentable {
	public typealias NSViewType = WKWebView
	
	@ObservedObject var viewModel: WebViewModel

	private let webView: WKWebView = WKWebView()

	public func makeUIView(context: UIViewRepresentableContext<SwiftUIWebView>) -> WKWebView {
		self.webView.navigationDelegate = context.coordinator
		self.webView.load(viewModel.request)
		return self.webView
	}

	public func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<SwiftUIWebView>) { }
}


#if DEBUG
struct SwiftUIWebView_Previews: PreviewProvider {
	static var previews: some View {
		SwiftUIWebView(viewModel: WebViewModel(urlString: "https://twitter.com/jkmazur")!)
	}
}
#endif

#endif
