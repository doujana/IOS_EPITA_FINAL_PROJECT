//
//  DetailViewController.swift
//  TableViewTest
//
//  Created by Sravan Nallala on 28/02/2020.
//  Copyright © 2020 fr.EpitaTableViewTest. All rights reserved.//

import UIKit

class DetailViewController: UIViewController {
    
    var film : Album?
   
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ReleasedLable: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var RecordType: UILabel!
    @IBOutlet weak var Lyrics: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        populateInfo()
    }
    
    func populateInfo() {
        guard let filmsData = film else {
            return
        }
        
        let lyrics: String = film?.explicit_lyrics ?? false  ? "Available" : "Not Available"
        titleLable.text = film?.title
        ReleasedLable.text =  film?.release_date
        Label.text = film?.label
        RecordType.text = film?.record_type
        Lyrics.text = lyrics
        setImageforDetailedView(urlString: film?.cover_medium ?? "")
        
    }
    
    func setImageforDetailedView(urlString : String){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: (url)!)
        albumImage.image = UIImage(data: data!)
    }
}
