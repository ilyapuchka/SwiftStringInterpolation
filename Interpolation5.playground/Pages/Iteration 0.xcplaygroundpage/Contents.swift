struct Markup: ExpressibleByStringInterpolation {

    init(stringLiteral value: String) {
        print(value)
    }

    init(stringInterpolation: Interpolation) {
        print(stringInterpolation)
    }

    struct Interpolation: StringInterpolationProtocol {
        init(literalCapacity: Int, interpolationCount: Int) {}
        mutating func appendLiteral(_ literal: String) {
            print(literal)
        }
        mutating func appendInterpolation(_ literal: String) {
            print(literal)
        }
    }

}

let blogPost: Markup = """
\("Blog post title")

I really like using \("Markdown").

But even more I like writing it in \("Swift")!
"""

print(blogPost)
