//
//  Factories.swift
//  SpotifyChallengeOne
//
//  Created by Philippe Muniz Gomes on 11/01/22.
//

import Foundation
import UIKit

let buttonHeight: CGFloat = 50

func makeImageView(named: String) -> UIImageView {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)

        // By making the image hug itself a little bit less and less resistant to being compressed
        // we allow the image to stretch and grow as required
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)

        return view
    }()
    
    return imageView
}

func makeTrackLabel(withText text: String) -> UILabel {
    let trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)

        return label
    }()
    
    return trackLabel
}

func makeAlbumLabel(withText text: String) -> UILabel {
    let albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray

        return label
    }()
    
    return albumLabel
}

func makePlayButton() -> UIButton {
    let playButton: UIButton = {
        let image = UIImage(named: "play") as UIImage?
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 50, y: 100, width: 50, height: 50)

        return button
    }()

    return playButton
}

func makePreviewLabel(withText text: String) -> UILabel {
    let previewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)

        return label
    }()
    
    return previewLabel
}

func makeProgressView() -> UIProgressView {
    let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = .gray

        return progressView
    }()
    
    return progressView
}

func makeSpotifyButton(withText title: String) -> UIButton {
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = .spotifyGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonHeight / 2
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 270, bottom: 600, trailing: 270)

        let attributedText = NSMutableAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
            ])

        button.setAttributedTitle(attributedText, for: .normal)
        
        return button
    }()

    return button
}

extension UIColor {
    static let spotifyGreen = UIColor(red: 28/255, green: 184/255, blue: 89/255, alpha: 1)
}
