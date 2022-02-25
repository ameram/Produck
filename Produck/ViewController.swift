//
//  ViewController.swift
//  Produck
//
//  Created by Ameer on 2/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var start_finish_button: UIButton!
    @IBOutlet weak var status_label: UILabel!
    var x = 0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func start_stop_tapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if x % 2 == 0 {
            sender.setTitle("Done", for: .normal)
            defaults.set(Date(), forKey: "start_time")
            x += 1
        } else {
            sender.setTitle("Start", for: .normal)
            let time_set = defaults.object(forKey: "start_time") as! Date

            let formattter = RelativeDateTimeFormatter()
            formattter.unitsStyle = .full
            
            status_label.text = "You worked \(formattter.localizedString(for: Date(), relativeTo: time_set))"
            x -= 1
        }
        
    }
    
}

