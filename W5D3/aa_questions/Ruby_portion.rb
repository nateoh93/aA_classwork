require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

#USERS

class Users
    attr_accessor :id, :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")

        data.map { |user| Users.new(user) }
    end

    def self.find_by_id(user_id)
        user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0

        Users.new(user.first)
    end

    def initialize(user_info)
        @id = user_info['id']
        @fname = user_info['fname']
        @lname = user_info['lname']
    end

    def create
        raise 'user is already in the database' if self.id

        QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            INSERT INTO
                users(fname, lname)
            VALUES
                (?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise 'user is not in database' unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, fname, lname, self.id)
            UPDATE
                users
            SET
                fname = ?, lname = ?
            WHERE
                id = ?
        SQL
    end
end

#QUESTIONS
class Questions
    attr_accessor :id, :title, :body, :associated_author_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")

        data.map { |question| Questions.new(question) }
    end

    def self.find_by_id(question_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0

        Questions.new(question.first)
    end

    def self.find_by_author_id(author_id)
        author =  QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            associated_author_id = ?
    SQL
    return author
    end

    def initialize(question_info)
        @id = question_info['id']
        @title = question_info['title']
        @body = question_info['body']
        @associated_author_id = question_info['associated_author_id']
    end

    def create
        raise 'question is already in the database' if self.id

        QuestionsDatabase.instance.execute(<<-SQL, title, body, associated_author_id)
            INSERT INTO
                questions(title, body, associated_author_id)
            VALUES
                (?, ?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise 'question is not in database' unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, title, body, associated_author_id, self.id)
            UPDATE
                questions
            SET
                title = ?, body = ?, associated_author_id = ?
            WHERE
                id = ?
        SQL
    end
end

#QUESTION FOLLOWS
class QuestionFollows
    attr_accessor :id, :users_id, :questions_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")

        data.map { |question_follow| QuestionFollows.new(question_follow) }
    end

    def self.find_by_id(question_follow_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, question_follow_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless question_follow.length > 0

        QuestionFollows.new(question_follow.first)
    end

    def initialize(question_follow_info)
        @id = question_follow_info['id']
        @users_id = question_follow_info['users_id']
        @questions_id = question_follow_info['questions_id']
    end

    def create
        raise 'question is already in the database' if self.id

        QuestionsDatabase.instance.execute(<<-SQL, users_id, questions_id)
            INSERT INTO
                question_follows(users_id, questions_id)
            VALUES
                (?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise 'question is not in database' unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, users_id, questions_id, self.id)
            UPDATE
                question_follows
            SET
                users_id = ?, questions_id = ?
            WHERE
                id = ?
        SQL
    end
end


#QUESTION_LIKES
class QuestionLikes
    attr_accessor :id, :users_id, :questions_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")

        data.map { |like| QuestionLikes.new(like) }
    end

    # def self.find_by_id(like_id)
    #     likes = QuestionsDatabase.instance.execute(<<-SQL, like_id)
    #         SELECT
    #             *
    #         FROM
    #             question_likes
    #         WHERE
    #             id = ?
    #     SQL
    #     return nil unless likes.length > 0

    #     QuestionLikes.new(likes.first)
    # end

    def initialize(likes_info)
        @id = likes_info['id']
        @users_id = likes_info['users_id']
        @questions_id = likes_info['questions_id']
    end

    def create
        raise 'You have already liked this' if self.id

        QuestionsDatabase.instance.execute(<<-SQL, users_id, questions_id)
            INSERT INTO
                question_likes(users_id, questions_id)
            VALUES
                (?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    # def update
    #     raise 'this instance of reply is not in database' unless self.id
    #     QuestionsDatabase.instance.execute(<<-SQL, body, users_id, questions_id, parent_reply_id, self.id)
    #         UPDATE
    #             replies
    #         SET
    #             body = ?, users_id = ?, questions_id = ?, parent_reply_id = ?
    #         WHERE
    #             id = ?
    #     SQL
    # end
end

#REPLIES
class Replies
    attr_accessor :id, :body, :users_id, :questions_id, :parent_reply_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")

        data.map { |reply| Replies.new(reply) }
    end

    def self.find_by_id(reply_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless reply.length > 0

        Replies.new(reply.first)
    end

    def initialize(reply_info)
        @id = reply_info['id']
        @body = reply_info['body']
        @users_id = reply_info['users_id']
        @questions_id = reply_info['questions_id']
        @parent_reply_id = reply_info['parent_reply_id']
    end

    def create
        raise 'this instance of reply is already in the database' if self.id

        QuestionsDatabase.instance.execute(<<-SQL, body, users_id, questions_id, parent_reply_id)
            INSERT INTO
                replies(body, users_id, questions_id, parent_reply_id)
            VALUES
                (?, ?, ?, ?)
        SQL

        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise 'this instance of reply is not in database' unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, body, users_id, questions_id, parent_reply_id, self.id)
            UPDATE
                replies
            SET
                body = ?, users_id = ?, questions_id = ?, parent_reply_id = ?
            WHERE
                id = ?
        SQL
    end
end