//
//  ProfilePageViewController.swift
//  instaprofilepage
//
//  Created by t2023-m0075 on 2023/09/12.
//

import UIKit
import SnapKit
import Photos

class ProfilePageViewController: UIViewController {
    
    var selectedImages: [UIImage] = []
    
    private let username = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 22)
        label.text = "nabaecamp"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        return label
    }()
    
    private let menuButton = {
        let button = UIButton()
        if let image = UIImage(named: "Menu") {
            button.setImage(image, for: .normal)
        }
        return button
    }()
    
    private let profileImage = {
        let imageView = UIImageView()
        if let image = UIImage(named: "Ellipse 1") {
            imageView.image = image
        }
        return imageView
    }()
    
    private let postNum = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 22)
        label.text = "7"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 16.5)
        return label
    }()
    
    private let followerNum = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 22)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 16.5)
        return label
    }()
    
    private let followingNum = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 22)
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 16.5)
        return label
    }()
    
    private let postLabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 19)
        label.text = "post"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    private let followerLabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 19)
        label.text = "follower"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    private let followingLabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 19)
        label.text = "following"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    private let bioUserName = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 19)
        label.text = "르탄이"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        return label
    }()
    
    private let bioText = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 19)
        label.text = "iOS Developer 🍎"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    private let bioLink = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: label.frame.width, height: 19)
        label.text = "spartacodingclub.kr"
        label.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    private let followButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let messageButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let moreButton = {
        let button = UIButton()
        if let image = UIImage(named: "More"){
            button.setImage(image, for: .normal)
        }
        return button
    }()
    
    private let lineView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 2)
        let stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.25, dy: 0.25)
        stroke.center = view.center
        stroke.layer.borderWidth = 0.5
        stroke.layer.borderColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1).cgColor
        return stroke
    }()
    
    private let gridButton = {
        let button = UIButton()
        if let image = UIImage(named: "Grid") {
            button.setImage(image, for: .normal)
        }
        button.addTarget(self, action: #selector(gridButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let userBackButton = {
        let button = UIButton()
        if let image = UIImage(named: "Profile - Fill") {
            button.setImage(image, for: .normal)
        }
        button.addTarget(self, action: #selector(userBackButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width - 4) / 3, height: (view.bounds.width - 4) / 3)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        picker.delegate = self
        
        usernameLayout()
        menuButtonLayout()
        profileImageLayout()
        postNumLayout()
        postLabelLayout()
        followerNumLayout()
        followerLabelLayout()
        followingNumLayout()
        followingLabelLayout()
        bioUsernameLayout()
        bioTextLayout()
        bioLinkLayout()
        followButtonLayout()
        messageButtonLayout()
        moreButtonLayout()
        lineViewLayeout()
        gridButtonLayout()
        profileCollectionViewLayout()
        userBackButtonLayout()
    }
    
    func usernameLayout() {
        view.addSubview(username)
        
        username.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview().offset(10)
        }
        
    }
    
    func menuButtonLayout() {
        view.addSubview(menuButton)
        
        menuButton.snp.makeConstraints { make in
            make.rightMargin.equalToSuperview().offset(-16)
            make.topMargin.equalToSuperview().offset(14)
        }
    }
    
    func profileImageLayout() {
        view.addSubview(profileImage)
        
        profileImage.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(14)
            make.topMargin.equalToSuperview().offset(49)
        }
    }
    
    func postNumLayout() {
        view.addSubview(postNum)
        
        postNum.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(152)
            make.topMargin.equalToSuperview().offset(72)
        }
    }
    
    func postLabelLayout() {
        view.addSubview(postLabel)
        
        postLabel.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(143)
            make.topMargin.equalToSuperview().offset(94)
        }
    }
    
    func followerNumLayout() {
        view.addSubview(followerNum)
        
        followerNum.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(232)
            make.topMargin.equalToSuperview().offset(72)
        }
    }
    
    func followerLabelLayout() {
        view.addSubview(followerLabel)
        
        followerLabel.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(213)
            make.topMargin.equalToSuperview().offset(94)
        }
    }
    
    func followingNumLayout() {
        view.addSubview(followingNum)
        
        followingNum.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(314)
            make.topMargin.equalToSuperview().offset(72)
        }
    }
    
    func followingLabelLayout() {
        view.addSubview(followingLabel)
        
        followingLabel.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(290)
            make.topMargin.equalToSuperview().offset(94)
        }
    }
    
    func bioUsernameLayout() {
        view.addSubview(bioUserName)
        
        bioUserName.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(15)
            make.topMargin.equalToSuperview().offset(151)
        }
    }
    
    func bioTextLayout() {
        view.addSubview(bioText)
        
        bioText.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(15)
            make.topMargin.equalToSuperview().offset(172)
        }
    }
    
    func bioLinkLayout() {
        view.addSubview(bioLink)
        
        bioLink.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview().offset(15)
            make.topMargin.equalToSuperview().offset(191)
        }
    }
    
    func followButtonLayout() {
        view.addSubview(followButton)
        
        followButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.leftMargin.equalToSuperview().offset(15)
            make.topMargin.equalToSuperview().offset(221)
        }
    }
    
    func messageButtonLayout() {
        view.addSubview(messageButton)
        
        messageButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.leftMargin.equalToSuperview().offset(173)
            make.topMargin.equalToSuperview().offset(221)
        }
    }
    
    func moreButtonLayout() {
        view.addSubview(moreButton)
        
        moreButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leftMargin.equalToSuperview().offset(330)
            make.topMargin.equalToSuperview().offset(221)
        }
    }
    
    func lineViewLayeout() {
        view.addSubview(lineView)
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leftMargin.equalToSuperview().offset(1)
            make.topMargin.equalToSuperview().offset(261)
        }
    }
    
    func gridButtonLayout() {
        view.addSubview(gridButton)
        
        gridButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leftMargin.equalToSuperview().offset(52)
            make.topMargin.equalToSuperview().offset(271)
        }
    }
    
    func profileCollectionViewLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(gridButton.snp.bottom).offset(10)
            make.bottom.equalToSuperview()  // 뷰 하단까지 스크롤
        }
        
    }
    
    func userBackButtonLayout() {
        view.addSubview(userBackButton)
        
        userBackButton.snp.makeConstraints { make in
            make.width.equalTo(375)
            make.height.equalTo(85)
            make.topMargin.equalToSuperview().offset(683)
        }
    }
    
    @objc func gridButtonTapped() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (newStatus) in
                if newStatus == .authorized {
                    self.openLibrary()
                }
            }
        case . authorized:
            self.openLibrary()
        default:
            print("사진 라이브러리 접근 권한이 거부되었습니다.")
        }
    }
    
    @objc func userBackButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
    
extension ProfilePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = UIImageView(frame: cell.contentView.bounds)
        imageView.image = selectedImages[indexPath.item]
        cell.contentView.addSubview(imageView)
        return cell
    }
    
    
}

extension ProfilePageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            selectedImages.append(selectedImage)
            collectionView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
}
