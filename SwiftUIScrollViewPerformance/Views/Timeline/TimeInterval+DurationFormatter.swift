
//
//  TimeInterval+DurationFormatter.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//
import Foundation

extension TimeInterval {
	private static let minutesFormatter = DateComponentsFormatter.minutesFormatter()
	private static let hoursFormatter = DateComponentsFormatter.hoursFormatter()

	public func asDurationString(forceNegativeSign: Bool = false) -> String {
		let prefix = self < 0 || forceNegativeSign ? "−" : ""

		let zero = "\(prefix)00:00"

		if self == 0 {
			return zero
		}

		let formatter = abs(self) >= 3600 ? Self.hoursFormatter : Self.minutesFormatter
		guard let formatted = formatter.string(from: abs(self)) else {
			return zero
		}
		
		return "\(prefix)\(formatted)"
	}
}

fileprivate extension DateComponentsFormatter {
	static func trackFormatter() -> DateComponentsFormatter {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .positional
		formatter.zeroFormattingBehavior = .pad
		return formatter
	}

	static func hoursFormatter() -> DateComponentsFormatter {
		let formatter = trackFormatter()
		formatter.allowedUnits = [.second, .minute, .hour]
		return formatter
	}

	static func minutesFormatter() -> DateComponentsFormatter {
		let formatter = trackFormatter()
		formatter.allowedUnits = [.second, .minute]
		return formatter
	}

}
