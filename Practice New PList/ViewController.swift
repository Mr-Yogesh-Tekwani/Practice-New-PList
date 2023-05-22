//
//  ViewController.swift
//  Practice New PList
//
//  Created by Yogesh Tekwani on 5/19/23.
//

import UIKit

class ViewController: UIViewController {

    let stack : UIStackView = {
        
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fill
        return s
    }()
    
    let tv : UITableView = {
        let t = UITableView(frame: .zero)
        return t
    }()
    
    let label : UILabel = {
        let l1 = UILabel()
        l1.text = "Presidents"
        l1.textColor = .black
        l1.font = UIFont(name: "Times New Roman", size: 33)
        return l1
    }()
    
    var allData : [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "PresidentList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        var conversion : [Dictionary<String, Any>] = dict!["presidents"] as! [Dictionary<String, Any>]
        
        for i in conversion {
            if let name = i["name"] as? String, let url = i["url"] as? String {
                let modDict = [name:url]
                allData.append(modDict)
            }
        }
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(tv)
        tv.dataSource = self
        tv.delegate = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cid")
        tv.reloadData()
        
        self.view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "cid", for: indexPath)
        cell.textLabel?.text = allData[indexPath.row].keys.first
        cell.textLabel?.textColor = .systemBlue
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let svc = SecViewController()
        let l = allData[indexPath.row].values.first
        
        if l != "" {
            svc.link = l!
            splitViewController?.showDetailViewController(svc, sender: self)
        }
    }
}

