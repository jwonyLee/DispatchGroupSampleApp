//
//  ViewController.swift
//  DispatchGroupSampleApp
//
//  Created by 이지원 on 2022/10/12.
//

import UIKit

final class ViewController: UIViewController {
    private let service: ServiceType = Service()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveMainScreenDidTap(_ sender: Any) {
        service.fetchData()
        moveMainScreen()
    }

    private func moveMainScreen() {
        let mainScreen: MainScreenViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "MainScreenViewController") { coder in
            MainScreenViewController(coder: coder, service: self.service)
        }

        navigationController?.pushViewController(mainScreen, animated: true)
    }
}

