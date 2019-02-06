extension DefaultStringInterpolation {
    mutating func appendInterpolation(h1 literal: String) {
        appendLiteral("#\(literal)")
    }

    mutating func appendInterpolation(italic literal: String) {
        appendLiteral("_\(literal)_")
    }

    mutating func appendInterpolation(bold literal: String) {
        appendLiteral("__\(literal)__")
    }
}

let markdown = """
\(h1: "Blog post title")

I really like using \(italic: "Markdown").

But even more I like writing it in \(bold: "Swift")!
"""

print(markdown)
