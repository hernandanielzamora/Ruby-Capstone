# Catalog my things!

<img src="https://i.postimg.cc/HxP1wGMd/cathalog-my-things-scheme.png" />

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    - [Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 Ruby Capstone: Cathalog my things <a name="about-project"></a>

**Cathalog my things** is a console app, built with Ruby, that allows the user to store, and catalog all sorts of things, such as books, games, and music albums. The user can also place additional information on the items, labels, authors, and genre. It provides a simple and intuitive interface for adding items, listing them by category, and performing various operations.
All data is going to be stored in separate JSON files, to ensure that the user input will be saved. Additionally, you can store the data in a corresponding database for future scalability. 
The program is structured according to the UML CLASS DIAGRAM.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
<summary>Backend</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
  </ul>
</details>
<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Key Features <a name="key-features"></a>

### Catalog Management:

- Ability to list all books, music albums, games, genres, labels, and authors.
- Add new books, music albums, and games to the catalog.
- View details of individual items, including their properties and associated authors/labels.

### Data Storage and Persistence:

- JSON file storage: Save and load catalog data from JSON files.
- Automatic archiving: Items older than 10 years are automatically archived.

### Class Structure and Inheritance:

- Use of object-oriented programming principles.
- Class hierarchy: Item class as the base class, with specific item types (books, music albums, games) inheriting from it.
- Author class to represent authors and their association with items.

### Data Validation and Error Handling:

- Validate user input for date formats and other required fields.
- Handle errors gracefully and provide meaningful error messages.

### Menu-Based Interface:

- Display a menu of options for users to select from.
- Input validation to ensure the user selects a valid option.

### Test Coverage:

- Unit tests for important classes and methods using a testing framework (e.g., RSpec).

### Linter Integration:

- Use a linter (e.g., RuboCop) to enforce a consistent coding style and identify potential issues.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Live Demo <a name="live-demo"></a>

You can find the live demo that we did in this [link](https://drive.google.com/file/d/1GwgpWpj2NG3-KfgMXyV_T8f3WZsMy3ju/view?usp=drive_link)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

If you would like to get a local copy up and running, please follow these steps.

### Prerequisites

In order to run this project you need to have ruby installed in your computer. You can check that by running `ruby -v` in your console <br>

If you do not have ruby installed in your computer, you can follow [this](https://gorails.com/setup/windows/10) tutorial (for Windows) <br>

For MacOS you can run the following commands: <br>

```bash
brew install rbenv ruby-build
# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 3.0.1
rbenv global 3.0.1
ruby -v
```

### Setup

Clone this repository to your desired folder:
```
cd my folder
git clone  https://github.com/hernandanielzamora/Ruby-Capstone.git
```

### Install

In order to fully make use of all the features you must run:

```
bundle install
```

### Usage

To run the project, you should run:

`ruby main.rb`

### Run tests

To run tests, you can use the following command:

`rspec spec`

### Deployment

To deploy this project locally, you can run:

`ruby main.rb`

## 👥 Authors <a name="authors"></a>

## 👥 Author: <a name="authors">Hernán Zamora</a>

- GitHub: [@hernandanielzamora](https://github.com/hernandanielzamora)
- Twitter: [@HernanZamora14](https://twitter.com/HernanZamora14)
- LinkedIn: [Linkedin](https://www.linkedin.com/in/hernan-zamora-03a697236/)

## 👥 Author: <a name="authors">Nshanji Hilary Ndzi</a>

- GitHub: [@dazehinn](https://github.com/dazehinn)
- Twitter: [@hilaryndzi](https://twitter.com/hilaryndzi)
- LinkedIn: [Linkedin](https://www.linkedin.com/in/nshanji-hilary-ndzi/)

## 👥 Author: <a name="authors">TUMBU BARTHOLOMEW ELAD</a>

- GitHub: [@githubhandle](https://github.com/elad237)
- Twitter: [@twitterhandle](https://twitter.com/Elad59380989)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/tumbu-elad-896ab2183/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- User interface
- Adding more functions:
  - **List all movies**
  - **List all sources (e.g. 'From a friend', 'Online shop')**
  - **Add a movie**
- Building full front-end

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/hernandanielzamora/Ruby-Capstone/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please express your appreciation on LinkedIn.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for teaching me Ruby.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/hernandanielzamora/Ruby-Capstone/blob/develop/LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
