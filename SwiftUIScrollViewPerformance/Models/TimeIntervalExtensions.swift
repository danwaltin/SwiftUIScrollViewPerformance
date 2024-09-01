//
//  TimeIntervalExtensions.swift
//  SwiftUIScrollViewPerformance
//
//  Created by Dan Waltin on 2024-09-01.
//

import Foundation

extension Int {
	var min: TimeInterval {
		get {
			return TimeInterval(60 * self)
		}
	}

	var sec: TimeInterval {
		get {
			return TimeInterval(self)
		}
	}
}

extension Double {
	var min: TimeInterval {
		get {
			return TimeInterval(60 * self)
		}
	}

	var sec: TimeInterval {
		get {
			return TimeInterval(self)
		}
	}
}
