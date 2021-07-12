//
//  BPITableViewController.swift
//  BitcoinPriceIndexDisplay
//
//  Created by Nana Adwoa Odeibea Amoah on 7/10/21.
//

import UIKit

class BPITableViewController: UITableViewController {
    
    var bpis: [BPriceIndex] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        getPriceIndex()
    }
    
    
    func getPriceIndex(){
        if let url = URL(string: "https://api.coinlore.net/api/coin/markets/?id=90") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) {(data, request, error) in
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                        if let bpiFromAPI = try? JSONDecoder().decode([BPriceIndex].self, from: data!){
                            
                            DispatchQueue.main.async {
                                self.bpis = bpiFromAPI.sorted(by: {
                                    $0.price < $1.price })
                                self.tableView.reloadData()
                            }
                            
                        }
                    }
                
            }.resume()
        }
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bpis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BPICell", for: indexPath) as? BPITableViewCell {
            let bpi = bpis[indexPath.row]
            cell.timeLabel.text = bpi.name
            cell.disclaimerLabel.text = String(bpi.price)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBPI = bpis[indexPath.row]
        performSegue(withIdentifier: "ShowDetails", sender: selectedBPI)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailViewController{
            if let selectedBPI = sender as? BPriceIndex {
                destinationVC.bpIndex = selectedBPI
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

  
}
