defmodule Training.Database.ShoppingList do
  use Ecto.Schema
  import Ecto.Changeset

  alias Training.Repo
  schema "shopping_list" do
    field :done, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc """
  Adds a new item to the shopping list.

  ## Examples

      iex> create_shopping_list(%{title: "title", done: false})
      {:ok, %ShoppingList{ title: "title", done: false}}

  """
  @spec create_shopping_list(map()) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  def create_shopping_list(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of shopping_list.

  ## Examples

      iex> list_shopping_list()
      [%ShoppingList{}, ...]

  """
  def list_shopping_list do
    Repo.all(__MODULE__)
  end

  @doc """
  Gets a single shopping_list.

  Raises `Ecto.NoResultsError` if the Shopping list does not exist.

  ## Examples

      iex> get_shopping_list!(123)
      %ShoppingList{}

      iex> get_shopping_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shopping_list!(id), do: Repo.get!(__MODULE__, id)

  @doc """
  Updates a shopping_list.

  ## Examples

      iex> update_shopping_list(shopping_list, %{field: new_value})
      {:ok, %ShoppingList{}}

      iex> update_shopping_list(shopping_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shopping_list(%__MODULE__{} = shopping_list, attrs) do
    shopping_list
    |> changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shopping_list.

  ## Examples

      iex> delete_shopping_list(shopping_list)
      {:ok, %__MODULE__{}}

      iex> delete_shopping_list(shopping_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shopping_list(%__MODULE__{} = shopping_list) do
    Repo.delete(shopping_list)
  end

  @doc false
  def changeset(shopping_list, attrs) do
    shopping_list
    |> cast(attrs, [:title, :done])
    |> validate_required([:title, :done])
  end
end
