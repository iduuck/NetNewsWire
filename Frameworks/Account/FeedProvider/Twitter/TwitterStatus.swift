//
//  TwitterStatus.swift
//  Account
//
//  Created by Maurice Parker on 4/16/20.
//  Copyright © 2020 Ranchero Software, LLC. All rights reserved.
//

import Foundation

final class TwitterStatus: Codable {

	let createdAt: Date?
	let idStr: String?
	let fullText: String?
	let displayTextRange: [Int]?
	let user: TwitterUser?
	let truncated: Bool?
	let retweeted: Bool?
	let retweetedStatus: TwitterStatus?
	let quotedStatus: TwitterStatus?

	enum CodingKeys: String, CodingKey {
		case createdAt = "created_at"
		case idStr = "id_str"
		case fullText = "full_text"
		case displayTextRange = "display_text_range"
		case user = "user"
		case truncated = "truncated"
		case retweeted = "retweeted"
		case retweetedStatus = "retweeted_status"
		case quotedStatus = "quoted_status"
	}
	
	var url: String? {
		guard let userURL = user?.url, let idStr = idStr else { return nil }
		return "\(userURL)/status/\(idStr)"
	}
	
	func renderAsText() -> String? {
		let statusToRender = retweetedStatus != nil ? retweetedStatus! : self
		if let text = statusToRender.fullText, let displayRange = statusToRender.displayTextRange, displayRange.count > 1,
			let startIndex = text.index(text.startIndex, offsetBy: displayRange[0], limitedBy: text.endIndex),
			let endIndex = text.index(text.startIndex, offsetBy: displayRange[1], limitedBy: text.endIndex) {
				return String(text[startIndex..<endIndex])
		} else {
			return fullText
		}
	}
	
	func renderAsHTML() -> String? {
		return nil
	}
	
}
