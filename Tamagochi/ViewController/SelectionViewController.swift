//
//  SelectionViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class SelectionViewController: UIViewController {
    @IBOutlet weak var tamagochiCollectionView: UICollectionView!
    
    let tamagoList = UserDefaultManager.tamagochiList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupCollectionView()
        configCollectionView()
    }
    
    private func setupLayout() {
        view.backgroundColor = Layout.backgroundColor
    }
    
    private func setupCollectionView() {
        tamagochiCollectionView.delegate = self
        tamagochiCollectionView.dataSource = self
        let nib = UINib(nibName: TamagochiCollectionViewCell.indentifier, bundle: nil)
        tamagochiCollectionView.register(nib, forCellWithReuseIdentifier: TamagochiCollectionViewCell.indentifier)
    }
    
    private func configCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing:CGFloat = 12
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width/3, height: width/3 + 36)
        layout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
        tamagochiCollectionView.collectionViewLayout = layout
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = .vertical
        tamagochiCollectionView.collectionViewLayout = layout
    }

}
// MARK: - CollectionView Delegate

extension SelectionViewController: UICollectionViewDelegate {
    
}
// MARK: - CollectionView Datasource

extension SelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagochiCollectionViewCell.indentifier, for: indexPath) as! TamagochiCollectionViewCell
        cell.tamagochiInfo = tamagoList[indexPath.item]
        return cell
    }
    
    
}
