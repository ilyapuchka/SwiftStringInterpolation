struct Markdown: ExpressibleByStringInterpolation {
    let parts: [String]
    init(stringLiteral value: String) {
        parts = [value]
    }

    init(stringInterpolation: Interpolation) {
        self.parts = stringInterpolation.parts
    }

    struct Interpolation: StringInterpolationProtocol {
        var parts: [String] = []
        init(literalCapacity: Int, interpolationCount: Int) {
            parts.reserveCapacity(2 * interpolationCount + 1)
        }

        mutating func appendLiteral(_ literal: String) {
            parts.append(literal)
        }

        mutating func appendInterpolation(_ literal: String) {
            appendLiteral(literal)
        }

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
}

let markdown: Markdown = """
\(h1: "Blog post title")

I really like using \(italic: "Markdown").

But even more I like writing it in \(bold: "Swift")!
"""

print(markdown)
