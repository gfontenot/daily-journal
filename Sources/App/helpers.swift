import Foundation

func displayContext(_ question: String) -> [String: String] {
  return [
    "title": "Daily Prompt",
    "question": question,
    "creation-url": question |> asPrompt |> dayoneURL
  ]
}

func asPrompt(_ question: String) -> String {
  return "> \(question)"
}

func dayoneURL(_  content: String) -> String {
  let journalName = encoded("Daily Q & A")
  return "dayOne://post?journal=\(journalName)&entry=\(encoded(content))"
}

private func encoded(_ string: String) -> String {
  var allowed: CharacterSet = .urlHostAllowed
  allowed.remove(charactersIn: "&")
  return string.addingPercentEncoding(withAllowedCharacters: allowed)!
}
