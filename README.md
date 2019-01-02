# README

Getting Started:

* Ruby version (v2.4.4)

* Rails Version (v5.2.2)

* System dependencies
    * MySQL (v5.7.24)
    * Bundler (v1.16.2)

* Configuration and steps for running application

1. Clone the repo.
<pre>
$ git clone https://github.com/binnib/Todo-List.git
$ cd application name
</pre>


2. Install gems
<pre>bundle install</pre>

3. Configure databased credentials by updating
<code>config/database.yml</code>

4. Create database and Run migration files
<pre>rails db:setup</pre>

5. Start the server
<pre>
rails s
</pre>

* UI interface
    * Used Bootstrap (v4.1) for UI

* Authorization with Cancancan gem

* Authentication with Devise gem
