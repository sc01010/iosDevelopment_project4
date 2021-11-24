//
//  ViewController.swift
//  sc2796_p5
//
//  Created by Steven Chen on 10/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    // TODO #1: Setup view
    private var filterCollectionView: UICollectionView!
    private var peopleCollectionView: UICollectionView!
    private var filterByLabel: UILabel!
    private var peopleLabel: UILabel!
    
    
    // Data
    private var filters: [Filter] = [Filter(filterName:"Chemistry"), Filter(filterName:"Computer Science"), Filter(filterName:"Biology"), Filter(filterName:"English"), Filter(filterName:"Physics"), Filter(filterName:"Mathematics"), Filter(filterName:"Oceanography"), Filter(filterName:"Economics"), Filter(filterName:"Psychology"), Filter(filterName:"Philosophy")]
    private var people: [Person] = [Person(name: "Stephen Lee", title: "Professor", image: UIImage(named: "stephen-lee")!, department: "Chemistry"), Person(name: "Jon Kleinberg", title: "Professor", image: UIImage(named: "jon-kleinberg")!, department: "Computer Science"), Person(name: "Archie Randolph Ammons", title: "Professor", image: UIImage(named: "archie-randolph-ammons")!, department: "English"), Person(name: "Mitchell Jay Feigenbaum", title: "Professor", image: UIImage(named: "mitchell-jay-feigenbaum")!, department: "Physics"), Person(name: "Marston Morse", title: "Instructor", image: UIImage(named: "marston-morse")!, department: "Mathematics"), Person(name: "Bruce Monger", title: "Instructor", image: UIImage(named: "bruce-monger")!, department: "Oceanography"), Person(name: "John Keith Moffat", title: "Associate Professor", image: UIImage(named: "john-keith-moffat")!, department: "Biology"), Person(name: "John Hopcroft", title: "Professor", image: UIImage(named: "john-hopcroft")!, department: "Computer Science"), Person(name: "Francine Dee Blau", title: "Professor", image: UIImage(named: "francine-dee-blau")!, department: "Economics"), Person(name: "Daryl Bem", title: "Professor", image: UIImage(named: "daryl-bem")!, department: "Psychology"), Person(name: "Kwame Anthony Appiah", title: "Professor", image: UIImage(named: "kwame-anthony-appiah")!, department: "Philosophy"), Person(name: "Brian Weatherson", title: "Associate Professor", image: UIImage(named: "brian-weatherson")!, department: "Philosophy"), Person(name: "Frank Spedding", title: "Assistant Professor", image: UIImage(named: "frank-spedding")!, department: "Chemistry"), Person(name: "George M. von Furstenberg", title: "Assistant Professor", image: UIImage(named: "george-m-von-furstenberg")!, department: "Economics"), Person(name: "Robert Endre Tarjan", title: "Assistant Professor", image: UIImage(named: "robert-endre-tarjan")!, department: "Computer Science")]
    private var filteredPeople: [Person] = []
    
    // TODO #2: Setup constants
    private let filtersCellReuseIdentifier = "filtersCellReuseIdentifier"
    private let peopleCellReuseIdentifier = "peopleCellReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Professors"
        view.backgroundColor = .white
        
        // TODO #3A: Setup flow layout for filter collectionView
        let filtersLayout = UICollectionViewFlowLayout()
        filtersLayout.scrollDirection = .horizontal
        filtersLayout.minimumInteritemSpacing = cellPadding
        
        // TODO #3B: Setup flow layout for people collectionView
        let peopleLayout = UICollectionViewFlowLayout()
        peopleLayout.minimumLineSpacing = cellPadding
        peopleLayout.minimumInteritemSpacing = cellPadding
        peopleLayout.scrollDirection = .vertical
        peopleLayout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        // TODO #4A: Instantiate filter collectionView
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filtersLayout)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO #4B: Instantiate restaurant collectionView
        peopleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: peopleLayout)
        peopleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO #5A: Create filter collectionView and register it here
        filterCollectionView.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: filtersCellReuseIdentifier)
        
        // TODO #5B: Create people collectionView and register it here
        peopleCollectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: peopleCellReuseIdentifier)
        
        // TODO #6A: Set filter collectionView data source
        filterCollectionView.dataSource = self
        
        // TODO #6B: Set people collectionView data source
        peopleCollectionView.dataSource = self
        
        // TODO #7A: Set filter collectionView delegate
        filterCollectionView.delegate = self
        
        // TODO #7B: Set people collectionView delegate
        peopleCollectionView.delegate = self
        
        view.addSubview(filterCollectionView)
        view.addSubview(peopleCollectionView)
        
        // TODO #8: Instantiate the filter by label and people label
        filterByLabel = UILabel()
        filterByLabel.translatesAutoresizingMaskIntoConstraints = false
        filterByLabel.adjustsFontSizeToFitWidth = true
        filterByLabel.text = "Filter By:"
        filterByLabel.textColor = .black
        filterByLabel.font = .systemFont(ofSize: 14)
        filterByLabel.textAlignment = .left
        view.addSubview(filterByLabel)
        
        peopleLabel = UILabel()
        peopleLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleLabel.adjustsFontSizeToFitWidth = true
        peopleLabel.text = "People:"
        peopleLabel.textColor = .black
        peopleLabel.font = .systemFont(ofSize: 14)
        peopleLabel.textAlignment = .left
        view.addSubview(peopleLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterByLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterByLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            filterByLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            filterByLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: filterByLabel.bottomAnchor, constant: 10),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            peopleLabel.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 15),
            peopleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            peopleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            peopleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            peopleCollectionView.topAnchor.constraint(equalTo: peopleLabel.bottomAnchor, constant: 10),
            peopleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            peopleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            peopleCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
}
// TODO #9: Conform to UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView {
            return filters.count
        } else {
            if filteredPeople.count == 0 {
                return people.count
            } else {
                return filteredPeople.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == filterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filtersCellReuseIdentifier, for: indexPath) as! FiltersCollectionViewCell
            cell.configure(for: filters[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: peopleCellReuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
            if filteredPeople.count == 0 {
                cell.configure(for: people[indexPath.item])
            } else {
                cell.configure(for: filteredPeople[indexPath.item])
            }
            return cell
        }
    }
}

// TODO #10: Confrom to UICollectionViewDelegateFlowLayout
// TODO #11: Conform to UICollectionViewDelegate, implement interaction
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == filterCollectionView {
            return CGSize(width: 125.0, height: 40.0)
        } else {
            let size = (collectionView.frame.width - cellPadding) / 2.0
            return CGSize(width: size, height: size)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            filters[indexPath.item].isSelected.toggle()
            filterCollectionView.reloadData()
            if filters[indexPath.item].isSelected == true {
                for person in people {
                    if (person.department == filters[indexPath.item].filterName) {
                        filteredPeople.append(person)
                        peopleCollectionView.reloadData()
                    }
                }
            } else {
                filteredPeople = filteredPeople.filter({ $0.department != filters[indexPath.item].filterName })
                peopleCollectionView.reloadData()
            }
        }
    }
}

