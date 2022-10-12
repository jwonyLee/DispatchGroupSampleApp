//
//  Service.swift
//  DispatchGroupSampleApp
//
//  Created by 이지원 on 2022/10/12.
//

import Foundation

protocol ServiceType {
    func fetchData()
    func getData(completion: @escaping (String) -> Void)
}

final class Service: ServiceType {
    private let dispatchGroup: DispatchGroup

    init() {
        dispatchGroup = DispatchGroup()
    }

    func fetchData() {
        dispatchGroup.enter()

        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
            self?.dispatchGroup.leave()
        }
    }

    func getData(completion: @escaping (String) -> Void) {
        dispatchGroup.notify(queue: .global()) {
            completion("100!")
        }
    }
}
