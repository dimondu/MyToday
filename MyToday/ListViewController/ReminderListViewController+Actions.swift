//
//  ReminderListViewController+Actions.swift
//  MyToday
//
//  Created by Дмитрий Дуров on 22.11.2022.
//

import UIKit



extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
