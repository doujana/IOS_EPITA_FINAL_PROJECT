//
//  APIService.swift
//  TableViewTest
//
//  Created by Sravan Nallala on 28/02/2020.
//  Copyright © 2020 fr.EpitaTableViewTest. All rights reserved.
//

import Foundation

class APIService {
    var albums :[Album] = []
    let albumArray = ["302127","302528","302729","302130","302931","302132","302133","302134","302135","302236","301236","312236","202236","702236"]
    let urlString: String = "https://api.deezer.com/album/"
   
    func fetchUsers(completionHandler: @escaping ([Album]) -> Void){
        
        for album in albumArray {
            
            guard let url = URL(string: urlString+album) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data, let album = try?
                JSONDecoder().decode(Album.self, from: data) {
                    self.albums.append(album)
                    let array = self.albums
                    completionHandler(array)
                }
                
            })
            task.resume()
        }
    }

}
