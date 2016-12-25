import Foundation

func context(for question: String) -> [String: String] {
  return [
    "question": question,
    "creation-url": dayoneURL(for: "> \(question)\r\r")
  ]
}

func dayoneURL(for content: String) -> String {
  let journalName = encoded("Daily Q & A")
  return "dayOne://post?journal=\(journalName)&entry=\(encoded(content))"
}

func encoded(_ string: String) -> String {
  var allowed: CharacterSet = .urlHostAllowed
  allowed.remove(charactersIn: "&")
  return string.addingPercentEncoding(withAllowedCharacters: allowed)!
}
