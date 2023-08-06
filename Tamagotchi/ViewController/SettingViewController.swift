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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        settingTableView.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        configBackBarButton(title: Title.setting)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        var content = cell.defaultContentConfiguration()
        let title = "내이름 설정하기"
        content.attributedText = NSAttributedString(string: title, attributes: [
            .font: Font.mainNameFont,
            .foregroundColor: Color.fontAndBorderColor
        ])
        content.image = UIImage(systemName: "pencil")
        content.imageProperties.tintColor = UIColor(cgColor: Color.fontAndBorderColor)
        let secondaryText = "고래밥"
        content.secondaryAttributedText = NSAttributedString(string: secondaryText, attributes: [
                .font: Font.mainNameFont,
                .foregroundColor: UIColor.lightGray
            ])
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        return cell
    }
    
    
}
