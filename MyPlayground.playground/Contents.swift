import UIKit

let currentDate = Date(timeIntervalSinceNow: 0)
print(currentDate)




private var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "MMM d yyyy"
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      return formatter
  }()

