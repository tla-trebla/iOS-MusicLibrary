//
//  ViewController.swift
//  MusicLibrary
//
//  Created by Albert Pangestu on 05/07/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    @IBAction func buttonClicked(_ sender: Any) {
        
        let apiKey = "9d736e7003289018f7ea496e4e035f3f"
        let url = URL(string: "https://api.musixmatch.com/ws/1.1/track.search?apikey=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
            
            print(json)
        }
        task.resume()
    }
    
}

