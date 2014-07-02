require 'spec_helper'

# Creating Tables with Migrations
#
# TODO: In db/migrate you will find several files that represent
#       migrations you will need to create. Go through the tests
#       below and edit the appropriate migration files to create the tables required
#       to make the specs pass. You will be working with migration files 01-04.
#
#       Don't worry about running migrations yourself. The test will run
#       them for you
#
# Hint: read both the English part of the spec, and each assertion to see what you need!

describe "migrations" do
  describe "creating tables" do
    before do
      @path = File.dirname(__FILE__)
      @db = ActiveRecord::Base.connection
    end

    context "/01_create_cats.rb" do
      before do
        ActiveRecord::Migrator.migrate('db/migrate', 1)
      end

      it "creates a table called cats" do
        #TODO: create a migration for a table called cats
        expect(@db.tables).to include("cats")
      end
    end

    context "/02_create_dogs.rb" do
      before do
        ActiveRecord::Migrator.migrate('db/migrate', 2)
      end

      it "creates a 'dogs' table using the 'up' and 'down' methods" do
        #TODO: create a migration to create a dogs table with an up/down method pair
        expect(@db.tables).to include("dogs")

        migration_text = File.read("db/migrate/02_create_dogs.rb")
        expect(migration_text).to match(/up/)
        expect(migration_text).to match(/down/)

        ActiveRecord::Migrator.rollback('db/migrate')

        expect(@db.tables).to_not include("dogs")
      end
    end

    context "/03_create_hamsters.rb" do
      before do
        ActiveRecord::Migrator.migrate('db/migrate', 3)
      end

      it "creates a 'hamsters' using the 'change' method" do
        # TODO: create a migration to create a hamsters table with the change method
        expect(@db.tables).to include("hamsters")
        migration_text = File.read("db/migrate/03_create_hamsters.rb")
        expect(migration_text).to match(/change/)
        expect(migration_text).to_not match(/up/)
        expect(migration_text).to_not match(/down/)

        ActiveRecord::Migrator.rollback('db/migrate', 2)

        expect(@db.tables).to_not include("hamsters")
      end
    end

    context "/04_create_homeworks.rb" do
      before do
        ActiveRecord::Migrator.migrate('db/migrate', 4)
      end

      it "creates a 'homeworks' table with at least 4 different column data types" do
        # TODO: include 4 columns in your migration with 4 different types (e.g. String, Integer, DateTime, etc)
        col_types = @db.columns("homeworks").map { |col| col.type }.uniq
        expect(col_types.count >= 4).to eq(true)
      end
    end
  end
end
