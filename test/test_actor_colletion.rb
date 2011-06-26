# This code is free software; you can redistribute it and/or modify it under
# the terms of the new BSD License.
#
# Copyright (c) 2011, Sebastian Staudt

require 'fixtures'
require 'helper'
require 'metior/collections/actor_collection'

class TestActorCollection < Test::Unit::TestCase

  context 'A collection of actors' do

    setup do
      repo = Metior::Git::Repository.new File.dirname(File.dirname(__FILE__))
      @@grit_commits ||= Fixtures.commits_as_grit_commits(''..'master')
      Grit::Repo.any_instance.stubs(:commits).returns @@grit_commits
      @authors = repo.authors
    end

    should 'be an instance of Collection' do
      assert @authors.is_a? Collection
    end

    should 'allow to get all the commits of those actors' do
      commits = @authors.commits
      assert commits.is_a? CommitCollection
      assert_equal 460, commits.size
      assert_equal '1b2fe77', commits.first.id
      assert_equal '80f136f', commits.last.id
    end

    should 'allow to get the commits of a single of those actors' do
      commits = @authors.commits 'tom@mojombo.com'
      assert commits.is_a? CommitCollection
      assert_equal 173, commits.size
      assert_equal 'a3c5139', commits.first.id
      assert_equal '634396b', commits.last.id
    end

  end

end