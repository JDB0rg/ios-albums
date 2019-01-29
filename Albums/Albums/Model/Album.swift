//
//  Album.swift
//  Albums
//
//  Created by Madison Waters on 1/28/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

import Foundation

struct Album: Codable {
    let artist: String
    let coverArt: [URL]
    let genres: [String]
    let id: UUID
    let albumName: String    
    let songs: [Song]
    
    enum Keys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs
        
        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Keys.self)
        
        artist = try container.decode(String.self, forKey: .artist)
        
        var coverArtContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var coverArtUrl: [URL] = []
        
        while coverArtContainer.isAtEnd == false {
            let urlContainer = try coverArtContainer.nestedContainer(keyedBy: Keys.CoverArtKeys.self)
            let urls = try urlContainer.decode(URL.self, forKey: .url)
        }
        coverArt = coverArtUrl
        
        genres = try container.decode([String].self, forKey: .genres)
        id = try container.decode(UUID.self, forKey: .id)
        
        albumName = try container.decode(String.self, forKey: .name)
        songs = try container.decode([Song].self, forKey: .songs)
    }
    
    func encode(with encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(artist, forKey: .artist)
        
        var coverArtContainer = container.nestedUnkeyedContainer(forKey: .coverArt)
        for coverArtUrl in coverArt {
            try coverArtContainer.encode(coverArtUrl.absoluteString)
        }
        
        try container.encode(genres, forKey: .genres)
        try container.encode(id, forKey: .id)
        try container.encode(albumName, forKey: .name)
        try container.encode(songs, forKey: .songs)
    }
    
}
