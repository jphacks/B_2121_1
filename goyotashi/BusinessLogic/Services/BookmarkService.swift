//
//  BookmarkService.swift
//  goyotashi
//
//  Created by Akihiro Kokubo on 2021/10/28.
//

import RxSwift

protocol BookmarkServiceType {
    func getBookmarkedGroups(userId: String) -> Single<[ProfileGroup]>
}

final class BookmarkService: BaseService, BookmarkServiceType {
    func getBookmarkedGroups(userId: String) -> Single<[ProfileGroup]> {
        return .just(TestData.profileGroups(count: 9))
    }
}
