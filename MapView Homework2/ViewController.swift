//
//  ViewController.swift
//  MapView Homework2
//
//  Created by Serper Kurmanbek on 04.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var textLabel2: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var places = Places()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = places.descroption
        imageView.image = UIImage(named: places.image)
    }

    @IBAction func showAtMap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailMapVC = storyboard.instantiateViewController(withIdentifier: "FullMapVC") as! MapViewController
        
        detailMapVC.mapLocations = places

        navigationController?.show(detailMapVC, sender: button)
    }
  
    
}

