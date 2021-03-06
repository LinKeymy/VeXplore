//
//  ProfileActionView.swift
//  VeXplore
//
//  Copyright © 2016 Jimmy. All rights reserved.
//


class ProfileActionView: UIView
{
    lazy var numLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = R.Font.Small
        label.textColor = .desc
        
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = R.Font.Small
        label.textColor = .note
        
        return label
    }()
    
    lazy var verticalLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .border
        
        return view
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(numLabel)
        addSubview(textLabel)
        addSubview(verticalLine)
        let bindings = [
            "numLabel": numLabel,
            "textLabel": textLabel,
            "verticalLine": verticalLine
        ]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[numLabel][textLabel]|", metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[verticalLine(0.5)]|", metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[verticalLine]|", metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[numLabel]|", metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[textLabel]|", metrics: nil, views: bindings))
        
        refreshColorScheme()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshColorScheme), name: NSNotification.Name.Setting.NightModeDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForReuse()
    {
        numLabel.font = R.Font.Small
        numLabel.text = R.String.Zero
        textLabel.font = R.Font.Small
    }
    
    @objc
    private func refreshColorScheme()
    {
        numLabel.textColor = .desc
        textLabel.textColor = .note
        verticalLine.backgroundColor = .border
        backgroundColor = .background
    }
    
}
