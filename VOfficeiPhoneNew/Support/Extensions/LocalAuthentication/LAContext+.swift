//
//  LAContext+.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 8/5/21.
//

import Foundation
import LocalAuthentication
import RxSwift
import RxCocoa

enum BiometricType: String {
    case none
    case touchID
    case faceID
}

struct BiometricContext {
    static let context: LAContext = {
        var authContext = LAContext()
        return authContext
    }()
}

extension BiometricContext{
    static func getBiometricType() -> BiometricType {
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        if #available(iOS 11, *) {
            let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch(context.biometryType) {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            @unknown default:
                return .none
            }
        } else {
            return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
    
    static func isAllowBioButton() -> Bool{
        let biometricType = getBiometricType()
        return [BiometricType.touchID, BiometricType.faceID].contains(biometricType)
    }
    
    static func showBiometricEvalute() -> Observable<Void>{
        return Observable.create { observer in
            
            let biometricType = getBiometricType()
            var error: NSError?
            let reason = biometricType == BiometricType.touchID ? localize(key: "lg_hay_dat_ngon_tay_len_phim_home", comment:  "Đặt ngón tay nhận dang touchId"): localize(key: "lg_nhan_dang_khuon_mat", comment:  "Đặt ngón tay nhận dang faceId")
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                    if success{
                        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
                            observer.onNext(())
                            observer.onCompleted()
                        })
                    }else{
                        print(error?.localizedDescription as Any)
                    }
                    
                }
            }
            
            return Disposables.create()
        }
    }
}




