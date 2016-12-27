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


drop.get("/create") { request in
  let url = request.data["date"]?.string
    .flatMap(question(for:))
    .map(asPrompt)
    .map(dayoneURL)

  if let url = url {
    return Response(redirect: url)
  } else {
    return try drop.view.make("today", [
      "title": "Today's Prompt"
    ])
  }
}

drop.run()
