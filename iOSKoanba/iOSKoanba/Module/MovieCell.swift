//
//  MovieCell.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
