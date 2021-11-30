//
//  RSAGateway.swift
//  VOfficeiPhoneNew
//
//  Created by Hoa Nguyen on 11/18/21.
//

import UIKit
import RxSwift
import MGArchitecture
import Then

protocol LoginGatewayType{
    func postRSAKeyPublicGateway() -> Observable<RSAKey>
    func postApiLoginGateway(username: String, password: String) -> Observable<Bool>
    func postGetUserInfoGateway() -> Single<Bool>
}

struct LoginGateway: LoginGatewayType {
    func postGetUserInfoGateway() -> Single<Bool> {
        let input = API.PostGetUserInfoInput()
        return Single.create { single in
            API.shared.postGetUserInfoInput(input)
                .subscribe(onNext: {result in
                    if (result.mess?.statusCode == 200){
                        Constant.share().user = result.user
                        single(.success(true))
                    }else{
                        single(.error(CommonApiError.apiNotConnectToInternet))
                    }
                }, onError: { error in
                    single(.error(error))
                })
           return Disposables.create()
        }
    }
    
    func postApiLoginGateway(username: String, password: String) -> Observable<Bool> {
        let params = API.PostAPILoginInputParams(username, password)
        let input = API.PostAPILoginInput(params: params)
        
        return Observable.create { observer in
            
            API.shared.postApiLogin(input)
                .subscribe(onNext: { result in
                print("LoginGatewayType - result", result)
                if (result.mess?.statusCode == 200){
                    Constant.share().userConfig = result.userConfig
                    observer.onNext(true)
                    observer.onCompleted()
                }else{
                    switch result.mess?.statusCode{
                    case 801:
                        switch result.errCode {
                        case 4, 7:
                            observer.onError(LoginApiError.ErrorCode801.accountLockedDueManyTimesIncorrect)
                            break
                        case 5:
                            observer.onError(LoginApiError.ErrorCode801.accountNotActivatedOrLocked)
                            break
                        case 8:
                            observer.onError(LoginApiError.ErrorCode801.accountLockedDueExpiredPassword)
                            break
                        case 204:
                            observer.onError(LoginApiError.ErrorCode801.accountNotActivatedOrLocked)
                            break
                        case 11, 12, 13, 151111:
                            observer.onError(LoginApiError.ErrorCode801.unknowError(result.detailErr ?? ""))
                            break
                        default:
                            observer.onError(LoginApiError.ErrorCode801.accountIsWrong)
                            break
                        }
                        break
                    case 111556, 202:
                        observer.onError(LoginApiError.accountIsWrong)
                        break
                    case 204:
                        observer.onError(LoginApiError.accountNotActivatedOrLocked)
                        break
                        
                    case 205:
                        observer.onError(LoginApiError.accountLockedDueManyTimesIncorrect)
                        break
                    case 208:
                        observer.onError(LoginApiError.accountLockedDueExpiredPassword)
                        break
                    default:
                        observer.onError(CommonApiError.apiNotConnectToInternet)
                        break
                    }
                    observer.onNext(false)
                    observer.onCompleted()
                }
            }, onError: { error in
                observer.onError(error)
                observer.onNext(false)
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
    
    func postRSAKeyPublicGateway() -> Observable<RSAKey> {
        let input = API.PostRSAKeyPublicInput()
        return API.shared.postRSAKeyPublic(input)
            .map{$0.rsaKey}
            .unwrap()
            .distinctUntilChanged{$0 == $1}
            .map { rsaKey in
                Constant.share().rsaKey = rsaKey
                return rsaKey
            }
    }
}
