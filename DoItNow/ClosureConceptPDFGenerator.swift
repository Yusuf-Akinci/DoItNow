import AppKit
import Foundation

let outputURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    .appendingPathComponent("ClosureConceptExplanation.pdf")

let pageRect = CGRect(x: 0, y: 0, width: 612, height: 792)
let margin: CGFloat = 54
let contentWidth = pageRect.width - margin * 2

let titleAttributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.boldSystemFont(ofSize: 24),
    .foregroundColor: NSColor.black
]

let headingAttributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.boldSystemFont(ofSize: 16),
    .foregroundColor: NSColor.black
]

let bodyParagraphStyle = NSMutableParagraphStyle()
bodyParagraphStyle.lineSpacing = 4
bodyParagraphStyle.paragraphSpacing = 10

let bodyAttributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 12),
    .foregroundColor: NSColor.black,
    .paragraphStyle: bodyParagraphStyle
]

let codeParagraphStyle = NSMutableParagraphStyle()
codeParagraphStyle.lineSpacing = 3
codeParagraphStyle.paragraphSpacing = 10

let codeAttributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.monospacedSystemFont(ofSize: 10.5, weight: .regular),
    .foregroundColor: NSColor.black,
    .paragraphStyle: codeParagraphStyle
]

enum Block {
    case title(String)
    case heading(String)
    case body(String)
    case code(String)
}

let blocks: [Block] = [
    .title("Closures in SwiftUI: Sending Data Back to a Parent View"),
    .body("This document explains the idea from zero. The goal is to understand why a child view can call a closure, pass a value into it, and let the parent view decide what happens next."),

    .heading("1. What is a closure?"),
    .body("A closure is a block of code that you can store in a variable or pass into something else. You can think of it as a function without a separate name."),
    .code("""
let sayHello = {
    print("Hello")
}

sayHello()
"""),
    .body("Here, sayHello stores some code. When you write sayHello(), that stored code runs."),

    .heading("2. A closure can receive values"),
    .body("Closures can also take parameters. A parameter is a value that gets handed into the closure when it runs."),
    .code("""
let greet = { name in
    print("Hello, \\(name)")
}

greet("Yusuf")
"""),
    .body("The closure receives \"Yusuf\" and uses it as name."),

    .heading("3. Closure type syntax"),
    .body("In Swift, this type means: take a String and return nothing."),
    .code("""
(String) -> Void
"""),
    .body("String is the input type. Void means no return value. So a closure with this type receives a String, does something, and does not give a value back."),

    .heading("4. Abstract example: NameInputView"),
    .body("Imagine a child view where the user types a name. The child view should not decide what the app does with the name. It should only send the name upward."),
    .code("""
struct NameInputView: View {
    let onSubmit: (String) -> Void

    @State private var name = ""

    var body: some View {
        VStack {
            TextField("Name", text: $name)

            Button("Submit") {
                onSubmit(name)
            }
        }
    }
}
"""),
    .body("The important line is let onSubmit: (String) -> Void. It means this view expects a closure from its parent. Later, when the button is tapped, the child calls onSubmit(name)."),

    .heading("5. How the parent uses it"),
    .body("The parent creates the child view and provides the closure."),
    .code("""
NameInputView { submittedName in
    print("The user submitted: \\(submittedName)")
}
"""),
    .body("submittedName is the value that came from the child. The child called onSubmit(name), and the parent received that same value as submittedName."),

    .heading("6. The timeline"),
    .body("""
1. The parent shows NameInputView.
2. The user types a name.
3. The user taps Submit.
4. NameInputView calls onSubmit(name).
5. The parent receives the name.
6. The parent decides what to do with it.
"""),

    .heading("7. Why not return the value?"),
    .body("SwiftUI views already return UI from their body property. User actions happen later, after the view has appeared. Because of that, a child view usually does not return data like a normal function. Instead, it calls a closure when the user does something."),
    .code("""
var body: some View {
    // This returns UI, not user data.
}
"""),
    .body("The closure is the communication path from the child back to the parent."),

    .heading("8. Same idea with an item"),
    .body("If a child view creates an Item, the closure type could be:"),
    .code("""
let onCreate: (Item) -> Void
"""),
    .body("That means: when the child creates an Item, it can pass that Item to the parent. The parent then decides whether to save it, ignore it, navigate away, or show an error."),

    .heading("9. Key idea"),
    .body("A closure like (Item) -> Void does not mean the child returns an Item. It means the child receives a function that can accept an Item. When the child has an Item ready, it calls that function."),
    .code("""
onCreate(newItem)
"""),
    .body("This line means: here is the new item; parent, run your code with it."),

    .heading("10. Mental model"),
    .body("""
Child view:
I collect or create a value.

Closure:
I carry that value upward.

Parent view:
I receive the value and decide what happens next.
""")
]

func attributedString(for block: Block) -> NSAttributedString {
    switch block {
    case .title(let text):
        return NSAttributedString(string: text + "\n", attributes: titleAttributes)
    case .heading(let text):
        return NSAttributedString(string: text + "\n", attributes: headingAttributes)
    case .body(let text):
        return NSAttributedString(string: text + "\n", attributes: bodyAttributes)
    case .code(let text):
        return NSAttributedString(string: text + "\n", attributes: codeAttributes)
    }
}

func height(for attributedString: NSAttributedString) -> CGFloat {
    let framesetter = CTFramesetterCreateWithAttributedString(attributedString)
    let suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(
        framesetter,
        CFRange(location: 0, length: attributedString.length),
        nil,
        CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude),
        nil
    )
    return ceil(suggestedSize.height) + 8
}

let data = NSMutableData()
guard let consumer = CGDataConsumer(data: data as CFMutableData) else {
    fatalError("Could not create PDF consumer.")
}

var mediaBox = pageRect
guard let context = CGContext(consumer: consumer, mediaBox: &mediaBox, nil) else {
    fatalError("Could not create PDF context.")
}

func startPage() {
    context.beginPDFPage(nil)
    context.setFillColor(NSColor.white.cgColor)
    context.fill(pageRect)
    context.translateBy(x: 0, y: pageRect.height)
    context.scaleBy(x: 1, y: -1)
}

func endPage() {
    context.scaleBy(x: 1, y: -1)
    context.translateBy(x: 0, y: -pageRect.height)
    context.endPDFPage()
}

startPage()
var y = margin

for block in blocks {
    let attributed = attributedString(for: block)
    let blockHeight = height(for: attributed)

    if y + blockHeight > pageRect.height - margin {
        endPage()
        startPage()
        y = margin
    }

    let path = CGMutablePath()
    path.addRect(CGRect(x: margin, y: y, width: contentWidth, height: blockHeight))
    let framesetter = CTFramesetterCreateWithAttributedString(attributed)
    let frame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: attributed.length), path, nil)
    CTFrameDraw(frame, context)

    y += blockHeight
}

endPage()
context.closePDF()

try data.write(to: outputURL)
print(outputURL.path)
