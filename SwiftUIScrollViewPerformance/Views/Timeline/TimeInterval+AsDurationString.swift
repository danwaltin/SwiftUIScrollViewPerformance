
//
//  TimeInterval+asDurationString.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//
import Foundation

fileprivate let formatter = DateComponentsFormatter.minutesFormatter()

extension TimeInterval {

	public func asDurationString() -> String {
		let zero = "00:00"

		if self == 0 {
			return zero
		}

		guard let formatted = formatter.string(from: abs(self)) else {
			return zero
		}
		
		return "\(formatted)"
	}
}

fileprivate extension DateComponentsFormatter {
	static func minutesFormatter() -> DateComponentsFormatter {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .positional
		formatter.zeroFormattingBehavior = .pad
		formatter.allowedUnits = [.second, .minute]
		return formatter
	}
}
