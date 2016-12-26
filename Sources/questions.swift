import Foundation

let questions = URL(fileURLWithPath: "./data/questions.json")
  |> { try! Data(contentsOf: $0) }
  |> { try! JSONSerialization.jsonObject(with: $0) as! [String: String] }

func question(for date: Date) -> String {
  let date = formatter.string(from: date)
  return questions[date]!
}
