import Foundation
import Kitura
import KituraStencil
import HeliumLogger

HeliumLogger.use()

let router = Router()
router.add(templateEngine: StencilTemplateEngine())

router.get("/") { request, response, next in
  let context = request.queryParameters["date"]
    .flatMap(question(for:))
    .map(displayContext)

  if let context = context {
    try! response.render("question.stencil", context: context).end()
  } else {
    try! response.performRedirect()
  }

  next()
}


router.get("/create") { request, response, next in
  let url = request.queryParameters["date"]
    .flatMap(question(for:))
    .map(asPrompt)
    .map(dayoneURL)

  if let url = url {
    try! response.redirect(url)
  } else {
    try! response.performRedirect()
  }

  next()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
