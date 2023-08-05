//
//  SelectionViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class SelectionViewController: UIViewController {
    typealias Name = LocalizedString.Tamagochi.Name
    // MARK: - IBOutlet

    @IBOutlet weak var tamagochiCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var tamagoList: [TamagochiInfo] = []
    private let userTamagoList: [TamagochiInfo] = UserDefaultManager.tamagochiList
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupCollectionView()
        configCollectionView()
        fetchList()
    }
    
    // MARK: - Methods
    
    private func setupLayout() {
    }
    
    /// 컬렉션뷰 세팅
    private func setupCollectionView() {
        tamagochiCollectionView.delegate = self
        tamagochiCollectionView.dataSource = self
        let nib = UINib(nibName: TamagochiCollectionViewCell.indentifier, bundle: nil)
        tamagochiCollectionView.register(nib, forCellWithReuseIdentifier: TamagochiCollectionViewCell.indentifier)
    }
    
    /// 컬렉션뷰 구성
    private func configCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let inset: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 2) - (inset * 2)
        layout.itemSize = CGSize(width: width/3, height: width/3 + 24)
        layout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: inset,
            bottom: spacing,
            right: inset
        )
        tamagochiCollectionView.collectionViewLayout = layout
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = .vertical
        layout.collectionView?.backgroundColor = Layout.backgroundColor
        tamagochiCollectionView.collectionViewLayout = layout
    }
    private func fetchList() {
        tamagoList.append(contentsOf: userTamagoList)
        for _ in 1...20 {
            tamagoList.append(
                TamagochiInfo(
                    tamagochiType: .none,
                    name: Name.none,
                    level: 1,
                    feedingCount: 1,
                    wateringCount: 1
                )
            )
        }
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
