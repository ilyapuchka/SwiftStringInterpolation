struct Markup: ExpressibleByStringInterpolation {
    // Type to store the semantics of the segments
    enum Element {
        case literal(String)
        case h1(String)
        case italic(String)
        case bold(String)
    }

    private let interpolationSegment: Any!
    private let parts: [Element]

    init<T>(stringInterpolationSegment expr: T) {
        interpolationSegment = expr
        parts = []
    }

    init(stringInterpolation strings: Markup...) {
        interpolationSegment = nil
        parts = strings.enumerated().map { (index, segment) -> Element in
            switch segment.interpolationSegment {
            case let str as String:
                return .literal(str)
            case let el as Element:
                return el
            default:
                fatalError("Should never happen 🤷‍♂️")
            }
        }
    }

}

let blogPost: Markup = """
\(Markup.Element.h1("Blog post title"))

I really like using \(Markup.Element.italic("Markdown")).

But even more I like writing it in \(Markup.Element.bold("Swift"))!
"""

print(blogPost)
