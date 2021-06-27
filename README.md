# SwiftUIWKWebView

`WKWebView` as  `NSViewRepresentable` for usage in macOS environment and `UIViewRepresentable` for `UIKit`

# Usage 

## Without ViewModel

Loading a website inside a frame, navigation is possible inside a webpage, but there is no `ObservedObject`

```swift
struct MyWebView: View {
    var body: some View {
        SwiftUIWKWebView(viewModel: .init(urlString: "https://apple.com")!)
    }
}
```

## With ViewModel

extend `WebViewModel` for more actions from `WKNavigationDelegate` 


```swift
struct MyWebView: View {
    @ObservedObject var viewModel: WebViewModel
	
    var body: some View {
        SwiftUIWKWebView(viewModel: viewModel)
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(viewModel: .init(urlString: "https://twitter.com/jkmazur")!)
    }
}
```
