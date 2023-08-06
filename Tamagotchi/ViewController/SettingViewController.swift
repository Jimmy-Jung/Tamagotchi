//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class SettingViewController: UIViewController {
    let cellIdentifier = "SettingTableViewCell"
    @IBOutlet weak var settingTableView: UITableView!
    private var settingList: [SettingManager.SettingsOption] = []
    private var settingManager = SettingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        settingManager.delegate = self
        settingList = settingManager.getList
        setNavigationColor()
        configUI()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        settingManager.SetList()
        settingList = settingManager.getList
        settingTableView.reloadData()
    }
    private func configUI() {
        view.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        settingTableView.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        configBackBarButton(title: Title.setting)
    }
    
    private func setupTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
    }
    

}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settingInfo = settingList[indexPath.row]
        settingInfo.handler()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingInfo = settingList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        var content = cell.defaultContentConfiguration()
        let title = settingInfo.title
        content.attributedText = NSAttributedString(string: title, attributes: [
            .font: Font.mainNameFont,
            .foregroundColor: Color.fontAndBorderColor
        ])
        content.image = settingInfo.icon
        content.imageProperties.tintColor = UIColor(cgColor: Color.fontAndBorderColor)
        if let secondaryText = settingInfo.secondaryText {
            content.secondaryAttributedText = NSAttributedString(
                string: secondaryText,
                attributes: [
                .font: Font.mainNameFont,
                .foregroundColor: UIColor.lightGray
            ])
        }
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        return cell
    }
    
    
}
