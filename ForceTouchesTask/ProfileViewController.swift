//
//  ProfileViewController.swift
//  ForceTouchesTask
//
//  Created by prog_zidane on 10/3/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //declare helper Variables
    var headerContainer : UIStackView!
    var cellId = "Cell"
    let postImages = [#imageLiteral(resourceName: "hello-i-m-nik-743251-unsplash"),#imageLiteral(resourceName: "max-nelson-492729-unsplash"),#imageLiteral(resourceName: "aditya-romansa-117344-unsplash"),#imageLiteral(resourceName: "caspar-rubin-224229-unsplash"),#imageLiteral(resourceName: "naassom-azevedo-180913-unsplash"),#imageLiteral(resourceName: "meghan-holmes-604864-unsplash"),#imageLiteral(resourceName: "sam-bloom-358675-unsplash"),#imageLiteral(resourceName: "ak-n-cakiner-413313-unsplash"),#imageLiteral(resourceName: "eva-darron-214170-unsplash"),#imageLiteral(resourceName: "taras-shypka-424924-unsplash"),#imageLiteral(resourceName: "naruto_uzumaki_naruto_hinata_hyugo_104228_1280x720"),#imageLiteral(resourceName: "neonbrand-629435-unsplash"),#imageLiteral(resourceName: "aurelien-designatic-396254-unsplash"),#imageLiteral(resourceName: "max-nelson-571823-unsplash")]
    
    
    let profileImageView:UIImageView = {
      let imageView = UIImageView()
      imageView.image = #imageLiteral(resourceName: "Profile")
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 60
      imageView.bounds = CGRect(x: 0, y: 0, width: 100, height:100 )
      imageView.borderWidth = 2
      imageView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
      
      return imageView
    }()
    
    let userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Mohamed Salah"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
    let locationLabel :UILabel = {
        let label = UILabel()
        label.text = "Cairo, EG"
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    let bioLabel :UILabel = {
        let label = UILabel()
        label.text = "In the end, it's not the years in your life that count.it's the life in your years"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let userStatesView :UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.shadow = true
        view.cornerRadius = 10
        return view
    }()
    
    
    let postsLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "14\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
        
        attributedText.append(NSAttributedString(string: "Posts", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        label.textAlignment = .center
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "1.5M\n", attributes: [NSAttributedString.Key.font :  UIFont.systemFont(ofSize: 16, weight: .bold)])
        
        attributedText.append(NSAttributedString(string: "Followers", attributes: [NSAttributedString.Key.foregroundColor :#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "71\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
        
        attributedText.append(NSAttributedString(string: "Following", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInfoView()
        setUserStatusView()
        setupPostsCollectionView()
    }

}
//Mark:- Create Views and add constraints
extension ProfileViewController {
    
    //Mark:- set header that contains user
    fileprivate func setupUserInfoView() {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, locationLabel, bioLabel])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        
        
        headerContainer = UIStackView(arrangedSubviews: [profileImageView,stackView])
        headerContainer.distribution = .fillProportionally
        headerContainer.axis = .horizontal
        headerContainer.alignment = .leading
        headerContainer.spacing = 20
        //headerContainer.center = view.center
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerContainer)
        
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.contentMode = .scaleAspectFill
        headerContainer.topAnchor.constraint(equalTo: view.topAnchor, constant:100).isActive = true
        headerContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        headerContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    //Mark:- set up user status view like followers , posts , following
    fileprivate func setUserStatusView(){
        let stackView = UIStackView(arrangedSubviews: [postsLabel, followersLabel, followingLabel])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        userStatesView.addSubview(stackView)
        view.addSubview(userStatesView)
        userStatesView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: userStatesView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: userStatesView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: userStatesView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: userStatesView.bottomAnchor).isActive = true
        
        userStatesView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        userStatesView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 40).isActive = true
        userStatesView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        userStatesView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //Mark:- Set up Posts Images
    fileprivate func setupPostsCollectionView(){
        collectionview.register(UserProfilePhotoCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.dataSource = self
        collectionview.delegate = self
        self.view.addSubview(collectionview)
        
        collectionview.topAnchor.constraint(equalTo: userStatesView.bottomAnchor, constant: 40).isActive = true
        collectionview.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionview.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        
    }
}

//Mark:- Conform Collection view delegates
extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3.8
        //For SE
        if UIScreen.main.nativeBounds.height == 1136 {
            print("se iphone")
            return CGSize(width: (view.frame.width - 2) / 4, height: (view.frame.width - 2) / 4)
        }
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? UserProfilePhotoCell
        cell?.photoImageView.image = postImages[indexPath.row]
        return cell!
    }
}
