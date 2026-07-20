import SwiftUI

struct ContentView: View {
    @State private var editorState: EditorState = .scrollable

    // MARK: View
    var body: some View {
        NavigationStack {
            Group {
                switch editorState {
                case .scrollable:
                    ScrollableEditorView()
                case .notScrollable:
                    NotScrollableEditorView()
                case .fixedSize:
                    FixedSizeEditorView()
                case .editorWithToolbar:
                    EditorWithToolbar()
                case .editorWithSwiftUIToolbar:
                    EditorWithSwiftUIToolbar()
                }
            }
            .navigationTitle("Infomaniak - RichHTMLEditor (SwiftUI)")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Picker("Switch Editor State", selection: $editorState) {
                        ForEach(EditorState.allCases, id: \.self) { state in
                            Text(state.rawValue)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

private enum EditorState: String, CaseIterable {
    case scrollable = "Scrollable"
    case notScrollable = "Not Scrollable"
    case fixedSize = "Fixed Size"
    case editorWithToolbar = "Editor with Toolbar"
    case editorWithSwiftUIToolbar = "Editor with SwiftUI Toolbar"
}
