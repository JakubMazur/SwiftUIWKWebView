//
//  WKWebView_AppKit.swift
//  SwiftUIWebView
//
//  Created by Jakub Mazur on 27/06/2021.
//

import SwiftUI
import WebKit

#if canImport(AppKit)
import AppKit

public struct SwiftUIWebView : NSViewRepresentable {
	public typealias NSViewType = WKWebView
	
	@ObservedObject var viewModel: WebViewModel
	
	private let webView: WKWebView = WKWebView()
			
	public func makeNSView(context: Context) -> WKWebView {
		self.webView.navigationDelegate = context.coordinator
		self.webView.load(viewModel.request)
		return self.webView
	}

	public func updateNSView(_ nsView: WKWebView, context: Context) { }
}

#if DEBUG
struct SwiftUIWebView_Previews: PreviewProvider {
	static var previews: some View {
		SwiftUIWebView(viewModel: WebViewModel(urlString: "https://twitter.com/jkmazur")!)
	}
}
#endif

#endif
