import Vapor

func routes(_ app: Application) throws {
    app.get { request -> EventLoopFuture<View> in
        let context = request
            .query["date"]
            .flatMap(question(for:))
            .map(displayContext)

        if let context = context {
            return app.view.render("question", context)
        } else {
            return app.view.render("today", [
                "title": "Today's Prompt"
            ])
        }
    }

    app.get("about") { _ -> EventLoopFuture<View> in
        return app.view.render("about")
    }
}
