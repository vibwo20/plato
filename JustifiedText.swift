import SwiftUI

public struct JustifiedText: UIViewRepresentable {
    private let text: String
    private let font: UIFont
    
    init(_ text: String, font: UIFont = .systemFont(ofSize: 14)) {
        self.text = text
        self.font = font
    }
    
    public func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.font = font
        textView.textAlignment = .justified
        textView.textColor = .darkGray
        textView.backgroundColor = .clear
        
        return textView
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
