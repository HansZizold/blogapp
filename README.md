<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 BLOG APP <a name="about-project"></a>

**BLOG APP** is a classic example of a blog website implemented using the Ruby on Rails Frawework. 
The application is a fully functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Editor</summary>
  <ul>
    <li><a href="https://code.visualstudio.com/">VSCODE Editor</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **The Blog allows to create users**
- **The users created need to authenticate to publish posts**
- **The users can make leave comments and likes for the posts**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

- [Blog App](https://cold-brook-8415.fly.dev/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- An editor of your preference, for example VSCODE
- Ruby 3.1.2 or newer
- Rails 7.0.4 or newer
- GIT
- NPM
- PostgreSQL

### Setup

Clone this repository to your desired folder:

    git clone https://github.com/HansZizold/blogapp
    cd ./blogapp

### Install

Install this project with:

    rails new blogapp
    bundle install

### Deployment

To deploy the project you need to create the database, you can use the following commands:

  -- TABLE CREATION
  rails generate migration CreateUsers name:string photo:string bio:text posts_counter:integer
  rails generate migration CreateComments text:text
  rails generate migration CreateLikes
  rails generate migration CreatePosts title:string text:text comment_counter:integer like_counter:integer

  --FOREIGN KEYS
  rails generate migration AddUserRefToComments user:references
  rails generate migration AddPostRefToComments post:references
  rails generate migration AddUserRefToLikes user:references
  rails generate migration AddPostRefToLikes post:references
  rails generate migration AddUserRefToPosts user:references

  --RENAME user_id to author_id
  rails generate migration ChangeColumnName
  --MIGRATION FILE CONTENT
    class ChangeColumnName < ActiveRecord::Migration[7.0]
      def change
        rename_column :posts, :user_id, :author_id
        rename_column :likes, :user_id, :author_id
        rename_column :comments, :user_id, :author_id
      end
    end

  -- DEFAUKT VALUES FOR COUNTERS
  rails generate migration CounterDefaultValues
  --MIGRATION FILE CONTENT
  class CounterDefaultValues < ActiveRecord::Migration[7.0]
    def change
      change_column_default :users, :posts_counter, 0
      change_column_default :posts, :comment_counter, 0
      change_column_default :posts, :like_counter, 0
    end
  end

Finally you can run:

  rails db: migrate;

### Usage

To run the project, execute the following command:

    rails server

### Run tests

To run tests, run the following command:

    rspec

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Hans Zizold**

- GitHub:[@githubhandle](https://github.com/HansZizold) 
- Twitter:[@twitterhandle](https://twitter.com/hanzio27) 
- LinkedIn:[LinkedIn](https://www.linkedin.com/in/hans-paul-zizold-37129037/) 

👤 **Rebaz Farid**

- GitHub:[@githubhandle](https://github.com/rebaz36) 
- LinkedIn:[LinkedIn](https://www.linkedin.com/in/rebaz-farid-1470b6155/) 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **User creation and authorization**
- [ ] **Creation of new posts**
- [ ] **Creation of comments and likes for posts**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/HansZizold/blogapp/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- My loving family 😊
- My partners from Microverse
- Inspiration, Dedication

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
