//
//  User.swift
//  TableViewTest
//
//  Created by Sravan Nallala on 28/02/2020.
//  Copyright © 2020 fr.EpitaTableViewTest. All rights reserved.
//

import Foundation

class AlbumResult:Codable{
    let results:[Album]
}



class Album:Codable
{
    let title :String
    let cover_medium : String
    let label : String
    let release_date : String
    let record_type : String
    let explicit_lyrics: Bool
}
