import Foundation
import Kitura
import KituraStencil
import HeliumLogger

HeliumLogger.use()

let router = Router()
router.add(templateEngine: StencilTemplateEngine())

router.get("/") { request, response, next in
  let date = request.queryParameters["date"]

  if let date = date {
    let context = question(for: date)
      |> displayContext

    try! response.render("question.stencil", context: context).end()
  } else {
    try! response.render("redirect.stencil", context: [:]).end()
  }

  next()
}


router.get("/create") { request, response, next in
  let date = request.queryParameters["date"]

  if let date = date {
    let url = question(for: date)
      |> asPrompt
      |> dayoneURL

    try! response.redirect(url)
  } else {
    try! response.render("redirect.stencil", context: [:]).end()
  }

  next()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
