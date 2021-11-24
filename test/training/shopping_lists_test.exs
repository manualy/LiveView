defmodule Training.ShoppingListTest do
  use Training.DataCase

  alias Training.Database

  describe "shopping_list" do
    alias Training.Database.ShoppingList

    @invalid_attrs %{done: nil, title: nil}

    test "list_shopping_list/0 returns all shopping_list" do
      {:ok, shopping_list} =
        ShoppingList.create_shopping_list(%{
          done: true,
          title: "some title"
        })

      assert ShoppingList.list_shopping_list() == [shopping_list]
    end

    test "get_shopping_list!/1 returns the shopping_list with given id" do
      {:ok, shopping_list} =
        ShoppingList.create_shopping_list(%{
          done: true,
          title: "some title"
        })

      assert ShoppingList.get_shopping_list!(shopping_list.id) == shopping_list
    end

    test "create_shopping_list/1 with valid data creates a shopping_list" do
      valid_attrs = %{done: true, title: "some title"}

      assert {:ok, %ShoppingList{} = shopping_list} =
               ShoppingList.create_shopping_list(valid_attrs)

      assert shopping_list.done == true
      assert shopping_list.title == "some title"
    end

    test "create_shopping_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ShoppingList.create_shopping_list(@invalid_attrs)
    end

    test "update_shopping_list/2 with valid data updates the shopping_list" do
      {:ok, shopping_list} =
        ShoppingList.create_shopping_list(%{
          done: true,
          title: "some title"
        })

      update_attrs = %{done: false, title: "some updated title"}

      assert {:ok, %ShoppingList{} = shopping_list} =
               ShoppingList.update_shopping_list(shopping_list, update_attrs)

      assert shopping_list.done == false
      assert shopping_list.title == "some updated title"
    end

    test "update_shopping_list/2 with invalid data returns error changeset" do
      {:ok, shopping_list} =
        ShoppingList.create_shopping_list(%{
          done: true,
          title: "some title"
        })

      assert {:error, %Ecto.Changeset{}} =
               ShoppingList.update_shopping_list(shopping_list, @invalid_attrs)

      assert shopping_list == ShoppingList.get_shopping_list!(shopping_list.id)
    end

    test "delete_shopping_list/1 deletes the shopping_list" do
      {:ok, shopping_list} =
        ShoppingList.create_shopping_list(%{
          done: true,
          title: "some title"
        })

      assert {:ok, %ShoppingList{}} = ShoppingList.delete_shopping_list(shopping_list)
      assert_raise Ecto.NoResultsError, fn -> ShoppingList.get_shopping_list!(shopping_list.id) end
    end
  end
end
