defmodule Demo.DirectoryTest do
  use Demo.DataCase

  alias Demo.Directory

  describe "businesses" do
    alias Demo.Directory.Business

    import Demo.DirectoryFixtures

    @invalid_attrs %{name: nil, tag: nil, description: nil}

    test "list_businesses/0 returns all businesses" do
      business = business_fixture()
      assert Directory.list_businesses() == [business]
    end

    test "get_business!/1 returns the business with given id" do
      business = business_fixture()
      assert Directory.get_business!(business.id) == business
    end

    test "create_business/1 with valid data creates a business" do
      valid_attrs = %{name: "some name", tag: "some tag", description: "some description"}

      assert {:ok, %Business{} = business} = Directory.create_business(valid_attrs)
      assert business.name == "some name"
      assert business.tag == "some tag"
      assert business.description == "some description"
    end

    test "create_business/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_business(@invalid_attrs)
    end

    test "update_business/2 with valid data updates the business" do
      business = business_fixture()
      update_attrs = %{name: "some updated name", tag: "some updated tag", description: "some updated description"}

      assert {:ok, %Business{} = business} = Directory.update_business(business, update_attrs)
      assert business.name == "some updated name"
      assert business.tag == "some updated tag"
      assert business.description == "some updated description"
    end

    test "update_business/2 with invalid data returns error changeset" do
      business = business_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_business(business, @invalid_attrs)
      assert business == Directory.get_business!(business.id)
    end

    test "delete_business/1 deletes the business" do
      business = business_fixture()
      assert {:ok, %Business{}} = Directory.delete_business(business)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_business!(business.id) end
    end

    test "change_business/1 returns a business changeset" do
      business = business_fixture()
      assert %Ecto.Changeset{} = Directory.change_business(business)
    end
  end
end
