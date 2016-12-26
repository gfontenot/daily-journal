import Kitura

extension RouterResponse {
  func performRedirect() throws {
    try render("redirect.stencil", context: [:]).end()
  }
}
