struct Markup: ExpressibleByStringInterpolation {
    let parts: [Element]

    enum Element {
        case literal(String)
        case h1(String)
        case italic(String)
        case bold(String)
    }

    init(stringLiteral value: String) {
        self.parts = [.literal(value)]
    }

    init(stringInterpolation: Interpolation) {
        self.parts = stringInterpolation.parts
    }

    struct Interpolation: StringInterpolationProtocol {
        var parts: [Element] = []
        init(literalCapacity: Int, interpolationCount: Int) {
            parts.reserveCapacity(2 * interpolationCount + 1)
        }

        mutating func appendLiteral(_ literal: String) {
            parts.append(.literal(literal))
        }

        mutating func appendInterpolation(_ literal: String) {
            parts.append(.literal(literal))
        }

        mutating func appendInterpolation(el: Element) {
            parts.append(el)
        }

        mutating func appendInterpolation(_ el: Element) {
            parts.append(el)
        }
    }
}

let blogPost: Markup = """
\(.h1("Blog post title"))

I really like using \(.italic("Markdown")).

But even more I like writing it in \(.bold("Swift"))!
"""

print(blogPost)
