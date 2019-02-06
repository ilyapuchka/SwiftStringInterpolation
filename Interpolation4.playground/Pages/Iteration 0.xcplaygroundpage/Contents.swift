struct Markup: ExpressibleByStringInterpolation {

    init<T>(stringInterpolationSegment expr: T) {
        print(expr)
    }

    init(stringInterpolation strings: Markup...) {
        print(strings)
    }
}

let blogPost: Markup = """
\("Blog post title")

I really like using \("Markdown").

But even more I like writing it in \("Swift")!
"""

print(blogPost)
