//
//  AlbumController.swift
//  Albums
//
//  Created by Madison Waters on 1/28/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

import Foundation

class AlbumController {
    
    let baseURL = URL(string: "https://albums-codable.firebaseio.com/")!
    
    func getAlbums(completion: @escaping ())
    
    static func testDecodingExampleAlbum() {
        
            guard let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") else {
                NSLog("JSON File does not exist")
                return
            }
        
            do {
                let albumData = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
        
                let album = try jsonDecoder.decode(Album.self, from: albumData)
                self.decodedAlbum = album
                print("Decode: \(decodedAlbum)")
            } catch {
                NSLog("Error decoding Album: \(error)")
            }
    
    }
    
    static func testEncodingExampleAlbum() {
        
        guard let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") else {
            NSLog("JSON File does not exist")
            return
        }
        
        do {
            let albumData = try Data(contentsOf: url)
            let decodedAlbum = try JSONDecoder().decode(Album.self, from: albumData)
            
            let jsonEncoder = JSONEncoder()
            let album = try jsonEncoder.encode(decodedAlbum.self)
            self.encodedAlbum = album
            print("Encode: \(encodedAlbum)")
        } catch {
            NSLog("Error decoding Album: \(error)")
        }
        
    }
    
    var albums: [Album] = []
    static var encodedAlbum: Data?
    static var decodedAlbum: Album?
    
}


