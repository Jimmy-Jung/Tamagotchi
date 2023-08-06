//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class SettingViewController: UIViewController {
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    

}

extension SettingViewController: UITableViewDelegate {
    
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")!
        var content = cell.defaultContentConfiguration()
        content.text = "내이름 설정하기"
        content.image = UIImage(systemName: "pencil")
        content.secondaryText = "고래밥"
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}
