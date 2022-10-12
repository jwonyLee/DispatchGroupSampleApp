//
//  MainScreenViewController.swift
//  DispatchGroupSampleApp
//
//  Created by 이지원 on 2022/10/12.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private let service: ServiceType

    @IBOutlet var label: UILabel?

    init?(coder: NSCoder, service: ServiceType) {
        self.service = service

        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("Use `init(coder:service:)` to initialize an `MainScreenViewController` instance.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        service.getData { [weak self] str in
            DispatchQueue.main.async {
                self?.label?.text = "Display Text: \(str)"
            }
        }
    }
}
