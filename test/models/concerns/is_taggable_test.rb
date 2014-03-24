require "test_helper"
require "set"

class IsTaggableTest < ActiveSupport::TestCase
  Temping.create :asset do
    include IsTaggable, IsAsset
    with_columns do |t|
      t.integer :larp_id
      t.string  :name
    end
  end

  class TagsAssociationThroughTagsString < ActiveSupport::TestCase
    setup do
      @asset = Asset.create! name: "MyAsset", larp: joe_larp
    end

    test "non preexisting tag is created on the fly" do
      assert_equal 0, Tag.where(name: "tag1").count
      @asset.update_attributes! tags_string: "tag1"
      assert_equal ["tag1"], @asset.tags.pluck(:name)
    end

    test "preexisting tag is correctly associated" do
      tag1 = Tag.create! name: "tag1", larp: joe_larp
      @asset.update_attributes! tags_string: "tag1"
      assert_equal [tag1], @asset.tags
    end

    test "tag name can contain space" do
      @asset.update_attributes! tags_string: "my tag"
      assert_equal ["my tag"], @asset.tags.pluck(:name)
    end

    test "various tag names can be passed, separated by commas" do
      @asset.update_attributes! tags_string: "tag1, tag2"
      assert_equal %w(tag1 tag2).to_set, @asset.tags.pluck(:name).to_set
    end

    test "repetitions of tag name are ignored" do
      @asset.update_attributes! tags_string: "tag1, tag1"
      assert_equal ["tag1"], @asset.tags.pluck(:name)
    end

    test "tag name is squished" do
      @asset.update_attributes! tags_string: "  my  tag "
      assert_equal ["my tag"], @asset.tags.pluck(:name)
    end

    test "blank tag name are ignored" do
      @asset.update_attributes! tags_string: "tag1, , "
      assert_equal ["tag1"], @asset.tags.pluck(:name)
    end

    test "associated tag whose name is absent from tags_string is de associated" do
      @asset.update_attributes! tags_string: "tag1"
      @asset.update_attributes! tags_string: ""
      assert_equal 0, @asset.tags.count
    end

    test "tags_string can be nil" do
      @asset.update_attributes! tags_string: nil
      assert_equal 0, @asset.tags.count
    end
  end

  class TagsStringMethod < ActiveSupport::TestCase
    test "#tags_string returns list of associated tag names separated by commas and ordered alphabetically" do
      Asset.create! name: "MyAsset", larp: joe_larp, tags_string: "tag2, tag1"
      assert_equal "tag1, tag2", Asset.where(name: "MyAsset").first.tags_string
    end

    test "#tags_string returns currently assigned value rather than names of associated tags in the db" do
      asset = Asset.create! name: "MyAsset", larp: joe_larp, tags_string: "tag2, tag1"
      asset.tags_string = "foo"
      assert_equal "foo", asset.tags_string
    end
  end
end
