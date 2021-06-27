//
//  WebViewViewModel.swift
//  SwiftUIWebView
//
//  Created by Jakub Mazur on 27/06/2021.
//

import Foundation

/// Can be used as `ObservedObject` for `WKNavigationDelegate`
public class WebViewModel: ObservableObject {
	/// `URLRequest` renderable inside `WKWebView`
	@Published public var request: URLRequest
	/// `didFinishLoading` is being called from `WKNavigationDelegate`
	@Published public var didFinishLoading: Bool = false

	/// If URL cannot be created from string using `URL(string:)` will return nil and print error in console
	public convenience init?(urlString: String) {
		guard let url = URL(string: urlString) else {
			print("cannot create valid `URL` from \(urlString)")
			return nil
		}
		self.init(url: url)
	}
	
	public convenience init(url: URL) {
		self.init(request: URLRequest(url: url))
	}
	
	public init(request: URLRequest) {
		self.request = request
	}
}
