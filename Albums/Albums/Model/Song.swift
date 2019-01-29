//
//  Song.swift
//  Albums
//
//  Created by Madison Waters on 1/28/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

import Foundation

struct Song: Codable {
    let duration: String
    let id: UUID
    let name: String
    
    enum SongKeys: String, CodingKey {
        case duration
        case id
        case name
        
        enum DurationKeys: String, CodingKey {
            case duration
        }
        
        enum NameKeys: String, CodingKey {
            case title
        }
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: SongKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        
        let durationContainer = try container.nestedContainer(keyedBy: SongKeys.DurationKeys.self, forKey: .duration)
        duration = try durationContainer.decode(String.self, forKey: .duration)
        
        let nameContainer = try container.nestedContainer(keyedBy: SongKeys.NameKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .title)
    }
}
