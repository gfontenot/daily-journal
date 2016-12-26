import Foundation

let formatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "MM/dd"
  return formatter
}()

extension Date {
  static var today: Date {
    return Date()
  }
}
