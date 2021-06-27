//
//  WKWebView_Common.swift
//  SwiftUIWebView
//
//  Created by Jakub Mazur on 27/06/2021.
//

import Foundation
import WebKit

extension SwiftUIWebView {
	public class Coordinator: NSObject, WKNavigationDelegate {
		private var viewModel: WebViewModel

		init(_ viewModel: WebViewModel) {
			self.viewModel = viewModel
		}

		public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
			self.viewModel.didFinishLoading = true
		}
	}

	public func makeCoordinator() -> SwiftUIWebView.Coordinator {
		Coordinator(viewModel)
	}
	
	/// Init `SwiftUIWebView` and create `WebViewModel` with URL.
	/// If URL cannot be created from string using `URL(string:)` will return nil
	/// - Parameter urlString: URLString, ex: `https://apple.com`
	public init?(urlString: String) {
		guard let viewModel = WebViewModel(urlString: urlString) else {
			return nil
		}
		self.init(viewModel: viewModel)
	}
	
	/// Init `SwiftUIWebView` and create `WebViewModel` with URL.
	/// - Parameter url: URL, ex: URL(string: "https://apple.com")
	public init(url: URL) {
		self.init(viewModel: .init(url: url))
	}
	
	/// Init `SwiftUIWebView` and create `WebViewModel` with URL.
	/// - Parameter request: `URLRequest` that can be represent as webpage
	public init(request: URLRequest) {
		self.init(viewModel: .init(request: request))
	}
}
