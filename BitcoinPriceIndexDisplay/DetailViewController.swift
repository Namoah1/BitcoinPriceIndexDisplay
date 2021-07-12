//
//  DetailViewController.swift
//  BitcoinPriceIndexDisplay
//
//  Created by Nana Adwoa Odeibea Amoah on 7/11/21.
//

import UIKit

class DetailViewController: UIViewController {

    var bpIndex = BPriceIndex()
    
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = String(bpIndex.price)
    }
    

    

}
