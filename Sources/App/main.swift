import Foundation
import Vapor
import HTTP

let drop = Droplet()

drop.get("/") { request in
  let context = request.data["date"]?.string
    .flatMap(question(for:))
    .map(displayContext)

  if let context = context {
    return try drop.view.make("question", context)
  } else {
    return try drop.view.make("today", [
      "title": "Today's Prompt"
    ])
  }
}

drop.get("/about") { _ in
  return try drop.view.make("about")
}

drop.run()
