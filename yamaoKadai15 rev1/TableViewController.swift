import UIKit

class TableViewController: UITableViewController {

    let keyName = "Name"
    let keyCheck = "Check"
    
    var items: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.items = [
            [keyName: "りんご", keyCheck: false],
            [keyName: "みかん", keyCheck: false],
            [keyName: "バナナ", keyCheck: true],
            [keyName: "パイナップル", keyCheck: false],
        ]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! ItemTableViewCell

        let item = self.items[indexPath.row]
        
        if item[keyCheck] as? Bool == true {
            cell.checkImageView.image = UIImage(named: "check")
        } else {
            cell.checkImageView.image = nil
        }
        cell.nameLabel.text = (item[keyName] as? String) ?? ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let check = self.items[indexPath.row][keyCheck] as? Bool {
            self.items[indexPath.row][keyCheck] = !check
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
        
    
    
    
    @IBAction func exitFromAddByCancel(segue: UIStoryboardSegue) {
        
    }

    @IBAction func exitFromAddBySave(segue: UIStoryboardSegue) {
        if let add = segue.source as? AddItemViewController {
            let item:[String: Any] = [keyName: add.nameTextField.text ?? "", keyCheck: false]
            self.items.append(item)
            self.tableView.reloadData()
        }
    }
}
