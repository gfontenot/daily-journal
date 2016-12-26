import Foundation
import Kitura
import KituraStencil
import HeliumLogger

HeliumLogger.use()

let router = Router()
router.add(templateEngine: StencilTemplateEngine())

router.get("/") { request, response, next in
  let date = request.queryParameters["date"]
    .flatMap(formatter.date(from:))

  let context = question(for: date ?? .today)
    |> displayContext

  try! response.render("question.stencil", context: context).end()
  next()
}


router.get("/create") { request, response, next in
  let url = question(for: .today)
    |> asPrompt
    |> dayoneURL

  try! response.redirect(url)
  next()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
