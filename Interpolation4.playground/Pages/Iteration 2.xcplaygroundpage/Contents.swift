enum Markup: ExpressibleByStringInterpolation {
    case literal(String)
    case h1(String)
    case italic(String)
    case bold(String)

    case interpolation(Any)
    case parts([Markup])

    init(stringInterpolation strings: Markup...) {
        let parts = strings.enumerated().map { (index, segment) -> Markup in
            switch segment {
            case let .interpolation(seg):
                switch seg {
                case let str as String:
                    return .literal(str)
                case let seg as Markup:
                    return seg
                default:
                    fatalError("Should never happen 🤷‍♂️")
                }
            default:
                fatalError("Should never happen 🤷‍♂️")
            }
        }
        self = .parts(parts)
    }

    init<T>(stringInterpolationSegment expr: T) {
        self = .interpolation(expr)
    }
}

let blogPost: Markup = """
\(Markup.h1("Blog post title"))

I really like using \(Markup.italic("Markdown")).

But even more I like writing it in \(Markup.bold("Swift"))!
"""

print(blogPost)
