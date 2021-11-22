//
//  ResearchPapersTVC.swift
//  ResearchPapers
//
//  Created by Joao Garrido on 22/11/2021.
//

import UIKit

class ResearchPapersTVC: UITableViewController {
    var reports : technicalReports? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "https://cgi.csc.liv.ac.uk/~phil/Teaching/COMP228/techreports/data.php?class=techreports2"){
            let session = URLSession.shared
            session.dataTask(with: url) { (data, response, err) in
                guard let jsonData = data else{
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let reportList = try decoder.decode(technicalReports.self, from: jsonData)
                    self.reports = reportList
                    DispatchQueue.main.async{
                        self.updateTheTable()
                    }
                } catch let jsonErr {
                    print("Error decoding json", jsonErr)
                }
            }.resume()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func updateTheTable(){
        print(reports?.techreports2.count ?? 0)
    }
    
    @IBOutlet var theTable: UITableView!
}
