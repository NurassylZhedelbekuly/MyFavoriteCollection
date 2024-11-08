//
//  ViewController.swift
//  SeguesExample
//
//  Created by Adilkhan M on 08.11.2024.
//

import UIKit

class ViewController: UIViewController {

    private var movies: [Movie] = [
        Movie(
            title: "Back to the Future",
            description: "A classic 1985 sci-fi adventure where Marty McFly travels back in time, accidentally altering his own future.",
            image: .backtothefuture,
            isFavorite: false,
            year: "1985"
        ),
        Movie(
            title: "Pulp Fiction",
            description: "A cult classic directed by Quentin Tarantino, intertwining stories of crime in Los Angeles with dark humor and stylized violence.",
            image: .pulpfiction,
            isFavorite: false,
            year: "1994"
        ),
        Movie(
            title: "Forrest Gump",
            description: "An inspiring tale of Forrest Gump, an extraordinary man with a low IQ, who witnesses and influences historical events in the 20th century.",
            image: .forrestgump,
            isFavorite: false,
            year: "1994"
        ),
        Movie(
            title: "The Shawshank Redemption",
            description: "The story of a man sentenced to life in Shawshank prison for crimes he didn’t commit, finding hope and friendship within the prison walls.",
            image: .shawshank,
            isFavorite: false,
            year: "1994"
        ),
        Movie(
            title: "Inglourious Basterds",
            description: "A WWII fantasy in which a group of Jewish-American soldiers plots to assassinate Nazi leaders in occupied France.",
            image: .basterds,
            isFavorite: false,
            year: "2009"
        ),
        Movie(
            title: "Star Wars",
            description: "The original epic space opera saga, chronicling the battle between the Rebel Alliance and the evil Galactic Empire.",
            image: .starwars,
            isFavorite: false,
            year: "1977"
        ),
        Movie(
            title: "Whiplash",
            description: "A young drummer faces intense physical and psychological challenges under a demanding music instructor.",
            image: .whiplash,
            isFavorite: false,
            year: "2014"
        ),
        Movie(
            title: "Django Unchained",
            description: "A freed slave teams up with a bounty hunter to rescue his wife from a brutal Mississippi plantation owner.",
            image: .jango,
            isFavorite: false,
            year: "2012"
        ),
        Movie(
            title: "The Godfather",
            description: "A cinematic masterpiece portraying the life of the powerful Italian-American crime family of Don Vito Corleone.",
            image: .godfather,
            isFavorite: false,
            year: "1972"
        ),
        Movie(
            title: "The Dark Knight",
            description: "Batman faces his greatest foe, the Joker, in this critically acclaimed film by Christopher Nolan.",
            image: .darkknight,
            isFavorite: false,
            year: "2008"
        )
    ]


    @IBOutlet private weak var tableView: UITableView!

    private var selectedMovie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondViewController else {
            return
        }
        destVC.configure(with: selectedMovie)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! PrimaryTableViewCell
        let currentModel = movies[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
