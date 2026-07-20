# Infomaniak Rich HTML Editor

**A seamless <abbr title="what you see is what you get">WYSIWYG</abbr> text editing experience for WebKit-available Apple platforms**

This fork of [Infomaniak Rich HTML Editor](https://github.com/Infomaniak/swift-rich-html-editor) adapts the project for use in [Thunderbird iOS.](https://github.com/thunderbird/thunderbird-ios)

## Features

- **HTML content editing**: Full support for viewing and editing HTML content directly
- **Many formatting commands**: bold, italic, links, images and more
- **Observable SwiftUI API**: Bindings for HTML document and selection/editor state
- **Cross platform**: Works with any [WebKit-available Apple platform](https://developer.apple.com/documentation/webkit)

## Examples

Add this repository URL to your Xcode project's package dependencies or to your [`Package.swift` dependencies](https://developer.apple.com/documentation/packagedescription/package/dependency):

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/thunderbird/swift-rich-html-editor", branch: "main")
    ]
)
```

The SwiftUI view is called `RichHTMLEditor` and takes two arguments:
- `html: Binding<String>` the HTML content of the editor
- `textAttributes: TextAttributes` the objects that contains the current state selected text (or the text at the insertion point) and is responsible to update the style

```swift
import InfomaniakRichHTMLEditor
import SwiftUI

struct ContentView: View {
    @State private var html = ""
    @StateObject private var textAttributes = TextAttributes()

    var body: some View {
        RichHTMLEditor(html: $html, textAttributes: textAttributes)
    }
}
```

The object `TextAttributes` contains various attributes about the current style of the selected text. Theses properties are read-only and are automatically updated by the editor.
To update the style, you should call the corresponding functions such as `bold()`.

Many modifiers are available to customize the editor and respond to editor's events:

```swift
RichHTMLEditor(html: $html, textAttributes: textAttributes)
    .editorScrollable(true)
    .editorInputAccessoryView(myToolbarView)
    .editorCSS("h1 { foreground-color: red; }")
    .onEditorLoaded {
        // Perform action when editor is loaded
    }
    .onCaretPositionChange { newPosition in
        // Perform action when caret moves
    }
    .onJavaScriptFunctionFail { error, function in
        // Perform action when an editor JavaScript function has failed
    }
    .introspectEditor { richEditorView in
        // Perform action on the editor (UI|NS)View
    }
```

Additionally, you can customize the editor with CSS. Use the `#swift-rich-html-editor` selector:

```css
#swift-rich-html-editor {
    padding: 16px;
}
```

### Example Project

[Example](Example) folder contains an Xcode project that builds a SwiftUI app for macOS and iOS.
