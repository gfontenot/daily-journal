import Foundation
import Kitura
import KituraStencil
import HeliumLogger

HeliumLogger.use()

let router = Router()
router.add(templateEngine: StencilTemplateEngine())

let formatter = DateFormatter()
formatter.dateFormat = "MM/dd"

let questions = URL(fileURLWithPath: "./data/questions.json")
  |> { try! Data(contentsOf: $0) }
  |> { try! JSONSerialization.jsonObject(with: $0) as! [String: String] }

router.get("/") { request, response, next in
  let today = formatter.string(from: Date())
  let question = questions[today]
    .map(context(for:))!

  try! response.render("question.stencil", context: question).end()
  next()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
