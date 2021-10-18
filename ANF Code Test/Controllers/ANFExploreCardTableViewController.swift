//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        tableView.register(ExploreContentCell.self, forCellReuseIdentifier: "ExploreContentCell")
        self.view.backgroundColor = UIColor().anf_tan()
        self.tableView.separatorStyle = .none
    }
    
    private var exploreData: [ExploreItem]? {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
         let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let decoder = JSONDecoder()
            do {
                let exploreItems = try decoder.decode([ExploreItem].self, from: fileContent)
                return exploreItems
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ExploreContentCell", for: indexPath) as! ExploreContentCell
        if let exploreItemForCell = exploreData?[indexPath.row] {
            cell.setExploreItem(exploreItem: exploreItemForCell)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let exploreItem = exploreData?[indexPath.row] else { return 0 }
        let exploreItemHeight = exploreItem.height
        return exploreItemHeight
    }
}
