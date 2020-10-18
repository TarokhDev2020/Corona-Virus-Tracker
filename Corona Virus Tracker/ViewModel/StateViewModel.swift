//
//  StateViewModel.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

class StateViewModel {
    
    // define some variables
    fileprivate let service = StateDataService()
    var stateItems = [Corona]()
    
    // define some functions
    func getState(completion: @escaping (ViewModelState) -> Void) {
        service.getState { (corona, err) in
            if let error = err {
                print(error.localizedDescription)
                completion(.failure)
                return
            }
            self.stateItems.append(corona!)
            completion(.success)
        }
    }
    
}
