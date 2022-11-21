//
//  ReminderListViewController.swift
//  MyToday
//
//  Created by Дмитрий Дуров on 19.11.2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    //MARK: - Public methods
    
    var dataSource: DataSourse!
    var reminders: [Reminder] = Reminder.sampleData
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        
        dataSource = DataSourse(collectionView: collectionView) { (collectionView: UICollectionView,
                                                                   indexPath: IndexPath,
                                                                   itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(reminders.map { $0.id })
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }
}

// MARK:  - Private methods

private func listLayout() -> UICollectionViewCompositionalLayout {
    var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
    listConfiguration.showsSeparators = false
    listConfiguration.backgroundColor = .clear
    
    return UICollectionViewCompositionalLayout.list(using: listConfiguration)
}

