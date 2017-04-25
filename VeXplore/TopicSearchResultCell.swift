//
//  TopicSearchResultCell.swift
//  VeXplore
//
//  Copyright © 2016 Jimmy. All rights reserved.
//


class TopicSearchResultCell: UITableViewCell
{
    lazy var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = R.Font.Small
        label.textColor = .desc
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var topicTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = R.Font.Medium
        label.numberOfLines = 0
        label.textColor = .body
        
        return label
    }()
    
    lazy var separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .border
        
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    private func commonInit()
    {
        contentView.addSubview(topicTitleLabel)
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(separatorLine)
        let bindings = [
            "topicTitleLabel": topicTitleLabel,
            "separatorLine": separatorLine,
            "cellTitleLabel": cellTitleLabel
        ]
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[cellTitleLabel(40)]-8-[topicTitleLabel]-8-|", metrics: nil, views: bindings))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[topicTitleLabel]-12-|", metrics: nil, views: bindings))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[separatorLine(0.5)]|", metrics: nil, views: bindings))
        cellTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        separatorLine.leadingAnchor.constraint(equalTo: topicTitleLabel.leadingAnchor).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: topicTitleLabel.trailingAnchor).isActive = true
        
        preservesSuperviewLayoutMargins = false
        layoutMargins = .zero
        selectionStyle = .none
        
        refreshColorScheme()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshColorScheme), name: NSNotification.Name.Setting.NightModeDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        cellTitleLabel.font = R.Font.Small
        topicTitleLabel.font = R.Font.Medium
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        contentView.layoutSubviews()
        topicTitleLabel.preferredMaxLayoutWidth = topicTitleLabel.bounds.width
    }
    
    @objc
    private func refreshColorScheme()
    {
        cellTitleLabel.textColor = .desc
        topicTitleLabel.textColor = .body
        separatorLine.backgroundColor = .border
        contentView.backgroundColor = .background
    }
    
}
