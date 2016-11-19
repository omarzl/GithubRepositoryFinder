//
//  RepoPresenter.swift
//  Github Repository Finder
//
//  Created by kryteria on 19/11/16.
//  Copyright © 2016 omarzl. All rights reserved.
//

import UIKit

class RepoPresenter: NSObject {

    // MARK: - Properties
    
    weak var repoUserInterface: RepoViewController?
    var interactor: RepoInteractorInput?
    var routing: RepoRouting?
    var repository:Repository!
    var contribuitors=[Owner]()
    var issues=[Issue]()
    var sections=[RepoDetailSection]()
    
    override init() {
        super.init()
        
        let infoRepositorySection=RepoDetailSection(name: "")
        let issuesSection=RepoDetailSection(name: Constants.Key.issues)
        let contributorsSection=RepoDetailSection(name: Constants.Key.contributors)
        
        sections=[infoRepositorySection,issuesSection,contributorsSection]
    }
    
}

// MARK: - RepoInteractorOutput

extension RepoPresenter: RepoInteractorOutput {
    
    func updateInterface() {
        issues.removeAll()
        contribuitors.removeAll()
        var maxIssues=repository.issues.count
        if repository.issues.count > 3{
            maxIssues=3
        }
        var maxContribuitors=repository.contributors.count
        if repository.contributors.count > 3{
            maxContribuitors=3
        }
        let topContributors=repository.contributors.sorted { (o1, o2) -> Bool in
            o1.contributions>o2.contributions
        }
        for i in 0..<maxIssues{
            issues.append(repository.issues[i])
        }
        for i in 0..<maxContribuitors{
            contribuitors.append(topContributors[i])
        }
        repoUserInterface?.reloadView()
    }
    
}

// MARK: - RepoInterface

extension RepoPresenter: RepoInterface {
    
    func setContentToView(view: UserCellProtocol, indexPath: IndexPath) {
        let row=indexPath.row
        if row < contribuitors.count{
            let user=contribuitors[indexPath.row]
            let contributionsText = user.contributions==1 ? "contribución" : "contribuciones"
            view.set(username: user.name+"\n\(user.contributions) \(contributionsText)")
            view.set(image: user.userImage)
        }
    }
    
    func setContentToView(view: InfoUserCellProtocol, indexPath: IndexPath) {
        let row=indexPath.row
        if row < issues.count{
            let issue=issues[row]
            let image=issue.owner?.userImage ?? ""
            let username=issue.owner?.name ?? ""
            view.set(title: issue.title)
            view.set(desc: issue.body)
            view.set(image: image)
            view.set(username: username)
        }
    }
    
    func setContentToView(view: DetailsCellProtocol, indexPath: IndexPath) {
        let image=repository.owner?.userImage ?? ""
        let username=repository.owner?.name ?? ""
        view.set(username: username)
        view.set(image: image)
        view.set(desc: repository.desc)
    }
    
    // MARK: - Set interface properties methods.

    func titleForView() -> String {
        return repository.name
    }
    
    func requestDetails() {
        interactor?.getIssues(repository: repository)
        interactor?.getContributors(repository: repository)
    }
    
    func numberOfSections()->Int{
        return sections.count
    }
    
    func numberOfRowsAtSection(index: Int)->Int{
        let section=sections[index]
        let name=section.name
        if name==Constants.Key.issues{
            return issues.count
        }
        if name==Constants.Key.contributors{
            return contribuitors.count
        }
        return 1
    }
    
    func titleForSection(index:Int) -> String {
        let section=sections[index]
        let rows=numberOfRowsAtSection(index: index)
        return rows == 0 ? "" : section.name
    }
    
}
