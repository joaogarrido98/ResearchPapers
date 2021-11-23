//
//  ResearchPapersTVC.swift
//  ResearchPapers
//
//  Created by Joao Garrido on 22/11/2021.
//

import UIKit

class ResearchPapersTVC: UITableViewController {
    var reports : technicalReports? = nil
    var index = -1

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports?.techreports2.count ?? 0
    }
    
    func updateTheTable(){
        theTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = theTable.dequeueReusableCell(withIdentifier: "theCell", for: indexPath)
        cell.textLabel?.text = reports?.techreports2[indexPath.row].title ?? "no title"
        cell.detailTextLabel?.text = reports?.techreports2[indexPath.row].authors ?? "no author"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetail"){
            let destination = segue.destination as! ViewController
            let selectedRow = theTable.indexPathForSelectedRow!.row
            let data = reports?.techreports2[selectedRow]
            destination.titles = data?.title
            destination.year = data?.year
            destination.authors = data?.authors
            destination.email = data?.email
            destination.abstract = data?.abstract
            destination.url = data?.pdf
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    @IBOutlet var theTable: UITableView!
}
