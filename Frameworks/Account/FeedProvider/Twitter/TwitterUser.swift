//
//  TwitterUser.swift
//  Account
//
//  Created by Maurice Parker on 4/16/20.
//  Copyright © 2020 Ranchero Software, LLC. All rights reserved.
//

import Foundation

struct TwitterUser: Codable {

	let name: String?
	let screenName: String?
	let avatarURL: String?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case screenName = "screen_name"
		case avatarURL = "profile_image_url_https"
	}
	
	var url: String {
		return "https://twitter.com/\(screenName ?? "")"
	}
	
}
